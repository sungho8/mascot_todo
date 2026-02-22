import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';
import '../../../viewmodels/statistics/statistics_viewmodel.dart';
import '../../../../domain/entities/statistics/heatmap_data_entity.dart';

class HeatmapCalendar extends ConsumerStatefulWidget {
  const HeatmapCalendar({super.key});

  @override
  ConsumerState<HeatmapCalendar> createState() => _HeatmapCalendarState();
}

class _HeatmapCalendarState extends ConsumerState<HeatmapCalendar> {
  late PageController _pageController;
  final int _initialPage = 1000; // Arbitrary middle
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _currentMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onMonthChanged(int pageIndex) {
    final offset = pageIndex - _initialPage;
    final now = DateTime.now();
    setState(() {
      _currentMonth = DateTime(now.year, now.month + offset, 1);
    });
    ref.read(statisticsViewModelProvider.notifier).setMonthOffset(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('히트맵', style: AppTypography.h3),

        AppSpacing.vSm,

        Container(
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: AppRadius.card,
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),

                  Text(
                    '${_currentMonth.year}년 ${_currentMonth.month}월',
                    style: AppTypography.h4,
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.chevron_right,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),

              AppSpacing.vSm,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  '일',
                  '월',
                  '화',
                  '수',
                  '목',
                  '금',
                  '토',
                ].map((d) => Text(d, style: AppTypography.caption)).toList(),
              ),

              AppSpacing.vSm,

              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onMonthChanged,
                  itemBuilder: (context, index) {
                    final offset = index - _initialPage;
                    final now = DateTime.now();
                    final month = DateTime(now.year, now.month + offset, 1);
                    return _buildMonthGrid(month, ref);
                  },
                ),
              ),

              const Divider(color: AppColors.border),

              _buildDayDetail(ref),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonthGrid(DateTime month, WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final firstDayOffset = month.weekday % 7; // Sunday = 0

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 42,
      itemBuilder: (context, index) {
        if (index < firstDayOffset || index >= firstDayOffset + daysInMonth) {
          return const SizedBox();
        }

        final day = index - firstDayOffset + 1;
        final date = DateTime(month.year, month.month, day);

        final heatmapData = state.heatmapData.firstWhere(
          (e) =>
              e.completionDate.year == date.year &&
              e.completionDate.month == date.month &&
              e.completionDate.day == date.day,
          orElse: () =>
              HeatmapDataEntity(completionDate: date, completedCount: 0),
        );

        final count = heatmapData.completedCount;
        Color color;
        if (count == 0) {
          color = AppColors
              .backgroundSecondary; // Instead of border to blend better, or border
        } else if (count <= 2) {
          color = AppColors.primary.withValues(alpha: 0.1);
        } else if (count <= 4) {
          color = AppColors.primary.withValues(alpha: 0.4);
        } else if (count <= 6) {
          color = AppColors.primary.withValues(alpha: 0.7);
        } else {
          color = AppColors.primary;
        }

        final isSelected =
            state.selectedDate?.year == date.year &&
            state.selectedDate?.month == date.month &&
            state.selectedDate?.day == date.day;

        return GestureDetector(
          onTap: () {
            ref.read(statisticsViewModelProvider.notifier).selectDate(date);
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppRadius.borderSm,
              border: isSelected
                  ? Border.all(color: AppColors.borderFocus, width: 2)
                  : Border.all(color: AppColors.border),
            ),
            child: Center(
              child: Text(
                '$day',
                style: AppTypography.caption.copyWith(
                  color: count > 4
                      ? AppColors.textOnDark
                      : AppColors.textPrimary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDayDetail(WidgetRef ref) {
    final state = ref.watch(statisticsViewModelProvider);
    if (state.selectedDate == null) {
      return Padding(
        padding: AppSpacing.all(AppSpacing.md),
        child: const Text(
          '날짜를 선택해 상세 내역을 확인하세요',
          style: AppTypography.subtitle2,
        ),
      );
    }

    if (state.dayDetails.isEmpty) {
      return Padding(
        padding: AppSpacing.all(AppSpacing.md),
        child: const Text(
          '해당 일자에 완료된 할 일이 없습니다',
          style: AppTypography.subtitle2,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.dayDetails.length,
      separatorBuilder: (_, __) => AppSpacing.vSm,
      itemBuilder: (context, index) {
        final detail = state.dayDetails[index];
        final catColor = Color(
          int.parse(detail.categoryColor.replaceFirst('#', '0xFF')),
        );
        return Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: catColor,
                shape: BoxShape.circle,
              ),
            ),

            AppSpacing.hSm,

            Expanded(child: Text(detail.title, style: AppTypography.body1)),
          ],
        );
      },
    );
  }
}
