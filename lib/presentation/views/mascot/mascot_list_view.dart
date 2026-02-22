import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/design_system/design_system.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../../domain/entities/mascot/mascot_entity.dart';

/// 마스코트 그리드에 표시할 아이콘 매핑
IconData _getMascotIcon(String name) {
  switch (name) {
    case '코코':
      return Icons.pets;
    case '루미':
      return Icons.local_fire_department;
    case '피피':
      return Icons.checklist;
    case '모모':
      return Icons.wb_twilight;
    case '두두':
      return Icons.bolt;
    case '나나':
      return Icons.stars;
    default:
      return Icons.pets;
  }
}

/// 마스코트 리스트 화면
/// BNV 2번째 탭으로 연결되며, 보유/미획득 마스코트를 그리드로 표시
class MascotListView extends ConsumerWidget {
  const MascotListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final mascots = state.mascots;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('마스코트'), centerTitle: false),
      body: Padding(
        padding: AppSpacing.screenHorizontal,
        child: CustomScrollView(
          slivers: [
            // 상단 안내 카드
            SliverToBoxAdapter(
              child: Padding(
                padding: AppSpacing.only(
                  top: AppSpacing.lg,
                  bottom: AppSpacing.md,
                ),
                child: Container(
                  padding: AppSpacing.cardPaddingLarge,
                  decoration: BoxDecoration(
                    color: AppColors.highlightBackground,
                    borderRadius: AppRadius.cardHighlight,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.pets,
                        color: AppColors.primary,
                        size: AppSpacing.iconMd,
                      ),

                      AppSpacing.hMd,

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('나의 마스코트', style: AppTypography.h4),

                            AppSpacing.vXxs,

                            Text(
                              '마스코트에게 할 일을 맡겨보세요!',
                              style: AppTypography.body2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 마스코트 그리드
            SliverPadding(
              padding: AppSpacing.only(bottom: AppSpacing.xxl),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final mascot = mascots[index];
                  return _MascotCard(
                    mascot: mascot,
                    onTap: mascot.isUnlocked
                        ? () {
                            context.push('/mascot/${mascot.id}');
                          }
                        : () {
                            _showUnlockHint(context, mascot);
                          },
                  );
                }, childCount: mascots.length),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 미획득 마스코트 힌트 팝업
  void _showUnlockHint(BuildContext context, MascotEntity mascot) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: AppSpacing.cardPaddingLarge,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: AppRadius.modalTop,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 핸들 바
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.backgroundTertiary,
                borderRadius: AppRadius.borderCircle,
              ),
            ),

            AppSpacing.vXl,

            // 마스코트 아이콘
            Container(
              width: AppSpacing.iconXxl,
              height: AppSpacing.iconXxl,
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getMascotIcon(mascot.name),
                size: 40,
                color: AppColors.iconInactive,
              ),
            ),

            AppSpacing.vLg,

            // 마스코트 이름
            Text(mascot.name, style: AppTypography.h3),

            AppSpacing.vXs,

            // 잠금 조건 뱃지
            Container(
              padding: AppSpacing.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.15),
                borderRadius: AppRadius.borderCircle,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_outline, size: 20, color: AppColors.warning),

                  AppSpacing.hXxs,

                  Text(
                    '잠겨있음',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.vLg,

            // 힌트 메시지
            Text(
              mascot.unlockDescription,
              textAlign: TextAlign.center,
              style: AppTypography.body1.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),

            AppSpacing.vXl,

            // 닫기 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonPrimary,
                  padding: AppSpacing.button,
                  shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
                ),
                child: Text('알겠어요!', style: AppTypography.buttonMedium),
              ),
            ),

            AppSpacing.vMd,
          ],
        ),
      ),
    );
  }
}

/// 마스코트 카드 위젯
class _MascotCard extends StatelessWidget {
  const _MascotCard({required this.mascot, this.onTap});

  final MascotEntity mascot;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: AppRadius.card,
          border: mascot.isUnlocked
              ? Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 1.5,
                )
              : Border.all(color: AppColors.border),
          boxShadow: mascot.isUnlocked
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 마스코트 아이콘 영역
            Container(
              width: AppSpacing.iconXxl,
              height: AppSpacing.iconXxl,
              decoration: BoxDecoration(
                color: mascot.isUnlocked
                    ? AppColors.primaryLight.withValues(alpha: 0.3)
                    : AppColors.backgroundSecondary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getMascotIcon(mascot.name),
                size: 40,
                color: mascot.isUnlocked
                    ? AppColors.primary
                    : AppColors.iconInactive,
              ),
            ),

            AppSpacing.vMd,

            // 마스코트 이름
            Text(
              mascot.name,
              style: mascot.isUnlocked
                  ? AppTypography.h4
                  : AppTypography.h4.copyWith(color: AppColors.textDisabled),
            ),

            AppSpacing.vXxs,

            // 레벨 또는 잠금 상태
            if (mascot.isUnlocked)
              Text(
                'Lv. ${mascot.level}',
                style: AppTypography.caption.copyWith(color: AppColors.primary),
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 18,
                    color: AppColors.textDisabled,
                  ),

                  AppSpacing.hXxs,

                  Text(
                    '미획득',
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textDisabled,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
