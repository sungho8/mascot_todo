import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../viewmodels/home/home_viewmodel.dart';

/// Todo 생성 바텀시트
class CreateTodoBottomSheet extends ConsumerStatefulWidget {
  const CreateTodoBottomSheet({super.key});

  @override
  ConsumerState<CreateTodoBottomSheet> createState() =>
      _CreateTodoBottomSheetState();
}

class _CreateTodoBottomSheetState
    extends ConsumerState<CreateTodoBottomSheet> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _titleFocusNode = FocusNode();
  bool _isFocus = false;
  bool _isLoading = false;
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _titleFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    setState(() => _isLoading = true);

    final success = await ref.read(homeViewModelProvider.notifier).createTodo(
          title: title,
          description: _descriptionController.text.trim().isEmpty
              ? null
              : _descriptionController.text.trim(),
          isFocus: _isFocus,
          categoryId: _selectedCategoryId,
        );

    if (mounted) {
      setState(() => _isLoading = false);
      if (success) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final categories = ref.watch(homeViewModelProvider).categories;

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg + bottomInset,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 핸들
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          AppSpacing.vLg,

          Text('새 TODO 추가', style: AppTypography.h3),

          AppSpacing.vLg,

          // 제목 입력
          TextField(
            controller: _titleController,
            focusNode: _titleFocusNode,
            decoration: InputDecoration(
              hintText: '할 일을 입력하세요',
              hintStyle: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
            ),
            style: AppTypography.body1,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _submit(),
          ),

          AppSpacing.vMd,

          // 메모 입력
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              hintText: '메모 (선택)',
              hintStyle: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              ),
            ),
            style: AppTypography.body2,
            maxLines: 2,
          ),

          // 카테고리 선택
          if (categories.isNotEmpty) ...[
            AppSpacing.vMd,

            Text(
              '카테고리',
              style: AppTypography.label.copyWith(
                color: AppColors.textSecondary,
              ),
            ),

            AppSpacing.vXs,

            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => AppSpacing.hXs,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = _selectedCategoryId == category.id;
                  final color = _colorFromHex(category.colorHex);

                  return GestureDetector(
                    onTap: () => setState(() {
                      _selectedCategoryId =
                          isSelected ? null : category.id;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? color.withValues(alpha: 0.1)
                            : AppColors.backgroundSecondary,
                        borderRadius: AppRadius.borderCircle,
                      ),
                      child: Text(
                        category.name,
                        style: AppTypography.caption.copyWith(
                          color: isSelected
                              ? color
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          AppSpacing.vMd,

          // 집중 과제 토글
          InkWell(
            onTap: () => setState(() => _isFocus = !_isFocus),
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Row(
                children: [
                  Icon(
                    _isFocus ? Icons.star : Icons.star_border,
                    color: _isFocus
                        ? AppColors.primary
                        : AppColors.textSecondary,
                    size: 22,
                  ),

                  AppSpacing.hSm,

                  Text(
                    '오늘의 집중 과제로 설정',
                    style: AppTypography.body1.copyWith(
                      color: _isFocus
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          AppSpacing.vLg,

          // 추가 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnDark,
                padding:
                    const EdgeInsets.symmetric(vertical: AppSpacing.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.textOnDark,
                      ),
                    )
                  : Text(
                      '추가',
                      style: AppTypography.h4.copyWith(
                        color: AppColors.textOnDark,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Color _colorFromHex(String colorHex) {
    try {
      return Color(int.parse('0xFF$colorHex'));
    } catch (_) {
      return AppColors.primary;
    }
  }
}
