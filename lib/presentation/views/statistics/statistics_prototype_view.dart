import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../domain/entities/user/user_entity.dart';
import '../../viewmodels/home/home_viewmodel.dart';
import '../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../viewmodels/statistics/statistics_state.dart';
import 'dart:math' as math;

class StatisticsPrototypeView extends ConsumerStatefulWidget {
  const StatisticsPrototypeView({super.key});

  @override
  ConsumerState<StatisticsPrototypeView> createState() =>
      _StatisticsPrototypeViewState();
}

class _StatisticsPrototypeViewState
    extends ConsumerState<StatisticsPrototypeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutQuart,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    final statsState = ref.watch(statisticsViewModelProvider);

    final user = homeState.user;

    if (user == null || statsState.status == StatisticsStatus.loading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Padding(
                  padding: AppSpacing.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroDashboard(user),
                      AppSpacing.vXl,
                      _buildSectionTitle(
                        '나의 성취',
                        Icons.local_fire_department_rounded,
                        AppColors.warning,
                      ),
                      AppSpacing.vMd,
                      _buildAchievementGrid(user),
                      AppSpacing.vXl,
                      _buildSectionTitle(
                        '활동 흐름',
                        Icons.waves_rounded,
                        AppColors.primary,
                      ),
                      AppSpacing.vMd,
                      _buildActivityStream(statsState),
                      AppSpacing.vXl,
                      _buildSectionTitle(
                        '마스코트 진화',
                        Icons.auto_awesome_rounded,
                        Colors.purpleAccent,
                      ),
                      AppSpacing.vMd,
                      _buildMascotEvolution(statsState),
                      AppSpacing.vXl,
                      AppSpacing.vXl,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120.0,
      floating: true,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.background,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        title: Text(
          '인사이트',
          style: AppTypography.h2.copyWith(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, Color iconColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        AppSpacing.hSm,
        Text(
          title,
          style: AppTypography.h3.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget _buildHeroDashboard(UserEntity user) {
    final progress = user.maxExp > 0 ? (user.currentExp / user.maxExp) : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Lv.${user.level} 마스터',
                    style: AppTypography.subtitle2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                AppSpacing.vMd,
                Text(
                  '훌륭해요!\n오늘도 성장 중입니다.',
                  style: AppTypography.h2.copyWith(
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                AppSpacing.vLg,
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    AppSpacing.hSm,
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: AppTypography.subtitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.hLg,
          // Decorative energetic circle
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              const Icon(Icons.pets_rounded, size: 50, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementGrid(UserEntity user) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildHighlightCard(
          title: '현재 연속 기록',
          value: '${user.currentStreak}일',
          icon: Icons.whatshot_rounded,
          color: AppColors.warning,
        ),
        _buildHighlightCard(
          title: '누적 완료',
          value: '${user.totalCompleted}개',
          icon: Icons.check_circle_rounded,
          color: AppColors.categoryHealth,
        ),
        _buildHighlightCard(
          title: '하루 최고 기록',
          value: '${user.dailyMaxCompleted}개',
          icon: Icons.workspace_premium_rounded,
          color: Colors.purpleAccent,
        ),
        _buildHighlightCard(
          title: '얼리버드 달성',
          value: '${user.earlyBirdCount}회',
          icon: Icons.wb_sunny_rounded,
          color: Colors.orangeAccent,
        ),
      ],
    );
  }

  Widget _buildHighlightCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTypography.h3.copyWith(fontWeight: FontWeight.w800),
              ),
              Text(
                title,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityStream(StatisticsState state) {
    if (state.status == StatisticsStatus.loading || state.heatmapData.isEmpty) {
      return Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Center(
          child: Text('데이터를 불러오는 중...', style: AppTypography.caption),
        ),
      );
    }

    // Convert heatmap data into a chronological list for the stream
    final latestData = state.heatmapData.length > 30
        ? state.heatmapData.sublist(state.heatmapData.length - 30)
        : state.heatmapData;
    final totalDays = latestData.length;

    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: totalDays,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final dayData = latestData[index];
          final completedCount = dayData.completedCount;
          final isToday = index == totalDays - 1;

          final height = math.max(
            10.0,
            completedCount * 12.0,
          ); // Scale the height by completions

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 16,
                height: height,
                decoration: BoxDecoration(
                  color: isToday
                      ? AppColors.primary
                      : AppColors.primary.withOpacity(
                          completedCount > 3
                              ? 0.7
                              : (completedCount > 0 ? 0.4 : 0.1),
                        ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isToday
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
              ),
              AppSpacing.vXs,
              if (index % 5 == 0 || isToday)
                Text(
                  isToday ? '오늘' : '${totalDays - index}일전',
                  style: AppTypography.caption.copyWith(
                    fontSize: 10,
                    color: isToday ? AppColors.primary : AppColors.textDisabled,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  ),
                )
              else
                const SizedBox(height: 14),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMascotEvolution(StatisticsState state) {
    if (state.mascotGrowthStats.isEmpty) {
      return const Center(
        child: Text('마스코트 기록이 없습니다.', style: AppTypography.caption),
      );
    }

    final activeStats = state.mascotGrowthStats
        .where((m) => m.isUnlocked)
        .toList();
    activeStats.sort(
      (a, b) => b.currentLevel.compareTo(a.currentLevel),
    ); // Sort by highest level

    return Column(
      children: activeStats.map((mascot) {
        final maxExpDouble = mascot.maxExp.toDouble();
        final progress = maxExpDouble > 0
            ? mascot.currentExp / maxExpDouble
            : 0.0;
        final isActive =
            mascot ==
            activeStats.first; // Top level mascot gets the active highlight

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: _buildMascotRow(
            mascot.mascotName,
            mascot.currentLevel,
            progress,
            isActive,
            mascot.currentExp,
            maxExpDouble,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMascotRow(
    String name,
    int level,
    double progress,
    bool isActive,
    double currentExp,
    double maxExp,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary.withOpacity(0.05)
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: isActive
            ? Border.all(
                color: AppColors.primary.withValues(alpha: 0.3),
                width: 1.5,
              )
            : null,
        boxShadow: isActive
            ? []
            : [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.03),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive
                  ? AppColors.primary.withValues(alpha: 0.2)
                  : AppColors.backgroundSecondary,
            ),
            child: Icon(
              Icons.catching_pokemon_rounded,
              size: 32,
              color: isActive ? AppColors.primary : AppColors.textDisabled,
            ),
          ),
          AppSpacing.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: AppTypography.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Lv.$level',
                        style: AppTypography.numberEmphasis.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                AppSpacing.vSm,
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isActive
                          ? AppColors.warning
                          : AppColors.primary.withValues(alpha: 0.5),
                    ),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
