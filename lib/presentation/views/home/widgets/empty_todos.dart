import 'package:flutter/material.dart';
import '../../../../core/design_system/design_system.dart';

/// 빈 TODO 상태 위젯
class EmptyTodos extends StatelessWidget {
  const EmptyTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pets,
            size: 80,
            color: AppColors.textSecondary.withValues(alpha: 0.3),
          ),

          AppSpacing.vLg,

          Text(
            '아직 할 일이 없어요!',
            style: AppTypography.h3.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          AppSpacing.vSm,

          Text(
            '첫 TODO를 만들어서\n마스코트와 함께 성장해보세요 🌱',
            textAlign: TextAlign.center,
            style: AppTypography.body1.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
