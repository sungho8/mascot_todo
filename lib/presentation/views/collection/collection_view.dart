import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/design_system.dart';

/// 컬렉션 화면
class CollectionView extends ConsumerWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('컬렉션')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.collections,
              size: AppSpacing.iconXxl,
              color: AppColors.primary,
            ),

            AppSpacing.vXl,

            Text('컬렉션 화면', style: AppTypography.h2),

            AppSpacing.vMd,

            Text(
              '수집한 마스코트를 확인하세요!',
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
