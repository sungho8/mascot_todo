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
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppRadius.card,
        border: Border.all(
          color: todo.isCompleted
              ? AppColors.border.withValues(alpha: 0.5)
              : AppColors.border,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onToggle,
          borderRadius: AppRadius.card,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (_) => onToggle?.call(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),

                AppSpacing.hMd,

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: AppTypography.h4.copyWith(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: todo.isCompleted
                              ? AppColors.textSecondary
                              : AppColors.textPrimary,
                        ),
                      ),

                      if (category != null) ...[
                        AppSpacing.vXs,

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(category!.colorHex)
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
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
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
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
