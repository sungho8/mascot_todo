import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/design_system.dart';
import '../../../domain/entities/todo/todo_entity.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../viewmodels/home/home_state.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/focus_task_card.dart';
import 'widgets/mascot_level_bar.dart';
import 'widgets/mascot_chat_bar.dart';
import 'widgets/empty_todos.dart';
import 'widgets/todo_item.dart';
import 'widgets/create_todo_bottom_sheet.dart';
import 'widgets/edit_todo_bottom_sheet.dart';

/// 홈 화면
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  void _showCreateTodoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreateTodoBottomSheet(),
    );
  }

  void _showEditTodoSheet(BuildContext context, TodoEntity todo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => EditTodoBottomSheet(todo: todo),
    );
  }

  void _showDeleteConfirm(BuildContext context, WidgetRef ref, String todoId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('TODO 삭제'),
        content: const Text('이 TODO를 삭제하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('취소'),
          ),

          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(homeViewModelProvider.notifier).deleteTodo(todoId);
            },
            child: Text('삭제', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: HomeAppBar(user: state.user),
      body: _buildBody(context, ref, state),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTodoSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, HomeState state) {
    if (state.status == HomeStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == HomeStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),

            AppSpacing.vMd,

            Text(
              state.errorMessage ?? '오류가 발생했습니다',
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            AppSpacing.vLg,

            ElevatedButton(
              onPressed: () {
                ref.read(homeViewModelProvider.notifier).loadHomeData();
              },
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(homeViewModelProvider.notifier).loadHomeData();
      },
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // 마스코트 + 채팅 입력 바
          // mainMascot이 없으면 마스터 목록 첫 번째로 fallback
          if (state.mainMascot != null || state.mascots.isNotEmpty)
            MascotChatBar(
              mascot: state.mainMascot ?? state.mascots.first,
              onTodoCreated: (title, categoryId, isRecurring) {
                ref
                    .read(homeViewModelProvider.notifier)
                    .createTodo(
                      title: title,
                      categoryId: categoryId,
                      isRecurring: isRecurring,
                    );
              },
            ),

          AppSpacing.vMd,

          if (state.focusTodo != null) ...[
            FocusTaskCard(focusTodo: state.focusTodo),

            AppSpacing.vMd,
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('TODO 목록', style: AppTypography.h3),

              Text(
                '${state.todos.where((t) => !t.isCompleted).length}개',
                style: AppTypography.body1.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          AppSpacing.vSm,

          if (state.todos.isEmpty)
            const SizedBox(height: 300, child: EmptyTodos())
          else
            ...state.todos.map(
              (todo) => TodoItem(
                todo: todo,
                category: todo.categoryId != null
                    ? state.categories
                          .where((c) => c.id == todo.categoryId)
                          .firstOrNull
                    : null,
                onToggle: () {
                  ref
                      .read(homeViewModelProvider.notifier)
                      .completeTodo(todo.id);
                },
                onEdit: () => _showEditTodoSheet(context, todo),
                onDelete: () => _showDeleteConfirm(context, ref, todo.id),
              ),
            ),

          AppSpacing.vMd,

          if (state.mainMascot != null)
            MascotLevelBar(mascot: state.mainMascot),

          AppSpacing.vXl,
        ],
      ),
    );
  }
}
