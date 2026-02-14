import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../domain/entities/todo/todo_entity.dart';

/// 오늘의 집중 과제 카드
class FocusTaskCard extends StatelessWidget {
  final TodoEntity? focusTodo;

  const FocusTaskCard({
    super.key,
    this.focusTodo,
  });

  @override
  Widget build(BuildContext context) {
    if (focusTodo == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppRadius.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                color: AppColors.textOnDark,
                size: 20,
              ),

              AppSpacing.hSm,

              Text(
                '오늘의 집중 과제',
                style: AppTypography.label.copyWith(
                  color: AppColors.textOnDark,
                ),
              ),
            ],
          ),

          AppSpacing.vMd,

          Text(
            focusTodo!.title,
            style: AppTypography.h3.copyWith(
              color: AppColors.textOnDark,
            ),
          ),
        ],
      ),
    );
  }
}
