import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../domain/entities/todo/todo_entity.dart';
import '../../../../domain/entities/category/category_entity.dart';
import '../../../../domain/entities/mascot/mascot_entity.dart';

/// TODO 아이템 위젯
class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final CategoryEntity? category;
  final MascotEntity? mascot;
  final VoidCallback? onToggle;

  const TodoItem({
    super.key,
    required this.todo,
    this.category,
    this.mascot,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: todo.isCompleted ? 0.45 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: AppRadius.borderXxl,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onToggle,
            borderRadius: AppRadius.borderXxl,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  // 체크 원 — 미체크: 링 / 체크: 민트 채움
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: todo.isCompleted
                          ? AppColors.primary
                          : Colors.transparent,
                      border: todo.isCompleted
                          ? null
                          : Border.all(
                              color: AppColors.border,
                              width: 1.5,
                            ),
                    ),
                    child: todo.isCompleted
                        ? const Icon(Icons.check, color: Colors.white, size: 18)
                        : null,
                  ),

                  AppSpacing.hMd,

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: AppTypography.h4.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),

                        if (category != null) ...[
                          AppSpacing.vXs,

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                              vertical: AppSpacing.xxs,
                            ),
                            decoration: BoxDecoration(
                              color: _getCategoryColor(category!.colorHex)
                                  .withValues(alpha: 0.1),
                              borderRadius: AppRadius.borderCircle,
                            ),
                            child: Text(
                              category!.name,
                              style: AppTypography.caption.copyWith(
                                color: _getCategoryColor(category!.colorHex),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  if (mascot != null) ...[
                    AppSpacing.hMd,

                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.pets,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String colorHex) {
    try {
      return Color(int.parse('0xFF$colorHex'));
    } catch (e) {
      return AppColors.primary;
    }
  }
}
