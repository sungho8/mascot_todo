import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/design_system.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../viewmodels/home/home_state.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/focus_task_card.dart';
import 'widgets/mascot_level_bar.dart';
import 'widgets/empty_todos.dart';
import 'widgets/todo_item.dart';

/// 홈 화면
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: HomeAppBar(user: state.user),
      body: _buildBody(context, ref, state),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: 새 TODO 생성 화면으로 이동
        },
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
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          if (state.focusTodo != null) ...[
            FocusTaskCard(focusTodo: state.focusTodo),

            AppSpacing.vLg,
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

          AppSpacing.vMd,

          if (state.todos.isEmpty)
            const SizedBox(height: 300, child: EmptyTodos())
          else
            ...state.todos.map(
              (todo) => TodoItem(
                todo: todo,
                onToggle: () {
                  ref
                      .read(homeViewModelProvider.notifier)
                      .completeTodo(todo.id);
                },
              ),
            ),

          AppSpacing.vLg,

          if (state.mainMascot != null)
            MascotLevelBar(mascot: state.mainMascot),

          AppSpacing.vXl,
        ],
      ),
    );
  }
}
