import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/design_system/design_system.dart';

/// 마스코트 Mock 데이터
class _MascotData {
  const _MascotData({
    required this.name,
    required this.isUnlocked,
    required this.level,
    required this.unlockCondition,
    required this.hint,
    required this.icon,
  });

  final String name;
  final bool isUnlocked;
  final int level;
  final String unlockCondition;
  final String hint;
  final IconData icon;
}

const List<_MascotData> _mascots = [
  _MascotData(
    name: '코코',
    isUnlocked: true,
    level: 1,
    unlockCondition: '기본 제공',
    hint: '',
    icon: Icons.pets,
  ),
  _MascotData(
    name: '루미',
    isUnlocked: false,
    level: 0,
    unlockCondition: '연속 3일 달성',
    hint:
        '으으… 아직 잠에서 깨기엔 이른 것 같아… �\n3일 연속으로 할 일을 해내면 눈을 뜰 수 있을 것 같은데…\n조금만 더 힘내줄래?',
    icon: Icons.local_fire_department,
  ),
  _MascotData(
    name: '피피',
    isUnlocked: false,
    level: 0,
    unlockCondition: '총 10개 Todo 완료',
    hint: '삐삐! 나는 피피라고 해! 📋\n아직은 만날 수 없지만… 할 일을 10개 완료하면\n내가 직접 찾아갈게! 기다려줘!',
    icon: Icons.checklist,
  ),
  _MascotData(
    name: '모모',
    isUnlocked: false,
    level: 0,
    unlockCondition: '새벽 5시에 5번 일어나기',
    hint:
        '…쿨쿨… 나는 새벽에만 깨어나는 모모야… 🌅\n새벽 5시에 할 일을 5번 완료하면\n내가 슬쩍 눈을 뜰지도 몰라… 쿨쿨…',
    icon: Icons.wb_twilight,
  ),
  _MascotData(
    name: '두두',
    isUnlocked: false,
    level: 0,
    unlockCondition: '하루에 5개 이상 Todo 완료',
    hint: '두둥! 나는 폭풍처럼 일하는 두두야! ⚡\n하루에 5개 이상 해치우는 날이 오면\n내가 번개처럼 나타날 거야! 준비됐어?',
    icon: Icons.bolt,
  ),
  _MascotData(
    name: '나나',
    isUnlocked: false,
    level: 0,
    unlockCondition: '연속 7일 달성',
    hint: '안녕… 나는 나나라고 해… ✨\n일주일 동안 매일 멈추지 않는 사람만이\n나를 만날 수 있어. 7일 연속 도전해볼래?',
    icon: Icons.stars,
  ),
];

/// 마스코트 리스트 화면
/// BNV 2번째 탭으로 연결되며, 보유/미획득 마스코트를 그리드로 표시
class MascotListView extends StatelessWidget {
  const MascotListView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  final mascot = _mascots[index];
                  return _MascotCard(
                    mascot: mascot,
                    onTap: mascot.isUnlocked
                        ? () {
                            context.push('/mascot/${mascot.name}');
                          }
                        : () {
                            _showUnlockHint(context, mascot);
                          },
                  );
                }, childCount: _mascots.length),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 미획득 마스코트 힌트 팝업
  void _showUnlockHint(BuildContext context, _MascotData mascot) {
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
                mascot.icon,
                size: AppSpacing.iconLg,
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
                  Icon(
                    Icons.lock_outline,
                    size: AppSpacing.iconXs,
                    color: AppColors.warning,
                  ),

                  AppSpacing.hXxs,

                  Text(
                    mascot.unlockCondition,
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
              mascot.hint,
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

  final _MascotData mascot;
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
                mascot.icon,
                size: AppSpacing.iconLg,
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
                    size: AppSpacing.iconXs,
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
