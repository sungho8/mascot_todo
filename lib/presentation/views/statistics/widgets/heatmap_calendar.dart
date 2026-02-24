import 'package:flutter/material.dart';
import '../../../../core/design_system/app_colors.dart';
import '../../../../core/design_system/app_spacing.dart';
import '../../../../core/design_system/app_typography.dart';
import '../../../../core/design_system/app_radius.dart';

class HeatmapCalendar extends StatefulWidget {
  const HeatmapCalendar({super.key});

  @override
  State<HeatmapCalendar> createState() => _HeatmapCalendarState();
}

class _HeatmapCalendarState extends State<HeatmapCalendar> {
  late PageController _pageController;
  final int _initialPage = 1000;
  late DateTime _currentMonth;
  DateTime? _selectedDate;

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
      _selectedDate = null; // 달이 바뀌면 선택 초기화
    });
  }

  // 더미 데이터 생성기: 날짜에 따라 일관된 랜덤값을 반환
  int _getDummyCount(DateTime date) {
    // 날짜의 숫자를 조합하여 0~8 사이의 값을 반환
    final seed = date.year * 10000 + date.month * 100 + date.day;
    final pseudoRandom = (seed * 13) % 9;
    return pseudoRandom;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_month_rounded,
              color: AppColors.primary,
              size: 24,
            ),
            AppSpacing.hSm,
            const Text('히트맵 캘린더', style: AppTypography.h3),
          ],
        ),
        AppSpacing.vSm,
        Container(
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: AppRadius.card,
            boxShadow: [
              BoxShadow(
                color: AppColors.textPrimary.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // 월 네비게이션
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
              // 요일 헤더
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
              // 달력 그리드 (스와이프)
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onMonthChanged,
                  itemBuilder: (context, index) {
                    final offset = index - _initialPage;
                    final now = DateTime.now();
                    final month = DateTime(now.year, now.month + offset, 1);
                    return _buildMonthGrid(month);
                  },
                ),
              ),
              AppSpacing.vSm,
              // 범례 (Legend)
              _buildLegend(),
              AppSpacing.vMd,
              const Divider(color: AppColors.border),
              // 하단 상세 내역
              _buildDayDetail(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonthGrid(DateTime month) {
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
        final count = _getDummyCount(date);

        // 디자인 스펙 (5단계)
        Color color;
        if (count == 0) {
          color = AppColors.border; // 회색
        } else if (count <= 2) {
          color = AppColors.primary.withValues(alpha: 0.1);
        } else if (count <= 4) {
          color = AppColors.primary.withValues(alpha: 0.4);
        } else if (count <= 6) {
          color = AppColors.primary.withValues(alpha: 0.7);
        } else {
          color = AppColors.primary; // 7개 이상
        }

        final isSelected =
            _selectedDate?.year == date.year &&
            _selectedDate?.month == date.month &&
            _selectedDate?.day == date.day;

        // 스트릭 강조 (가상의 연속 달성 조건: 값이 3 이상이면 스트릭이라고 가정)
        final isStreak = count >= 3;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: AppRadius.borderSm,
              // 스트릭이 포함된 날짜는 오렌지색 보더로 강조 (스펙 반영)
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2)
                  : (isStreak
                        ? Border.all(
                            color: AppColors.warning.withValues(alpha: 0.6),
                            width: 1.5,
                          )
                        : null),
            ),
            child: Center(
              child: Text(
                '$day',
                style: AppTypography.caption.copyWith(
                  color: count > 4
                      ? AppColors.textOnDark
                      : AppColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDayDetail() {
    if (_selectedDate == null) {
      return Padding(
        padding: AppSpacing.all(AppSpacing.md),
        child: const Text(
          '날짜를 선택해 상세 내역을 확인하세요',
          style: AppTypography.subtitle2,
        ),
      );
    }

    final count = _getDummyCount(_selectedDate!);
    if (count == 0) {
      return Padding(
        padding: AppSpacing.all(AppSpacing.md),
        child: const Text(
          '해당 일자에 완료된 할 일이 없습니다',
          style: AppTypography.subtitle2,
        ),
      );
    }

    // 더미 완료 목록 생성
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count > 3 ? 3 : count, // 최대 3개까지만 더미로 표시
      separatorBuilder: (_, __) => AppSpacing.vSm,
      itemBuilder: (context, index) {
        final colors = [
          AppColors.categoryHealth,
          AppColors.categoryWork,
          AppColors.categoryStudy,
        ];
        final titles = ['아침 조깅하기', '코딩 테스트 공부하기', '기술 블로그 포스팅 작성', '마스코트 밥 주기'];

        return Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                shape: BoxShape.circle,
              ),
            ),
            AppSpacing.hSm,
            Expanded(
              child: Text(
                titles[index % titles.length],
                style: AppTypography.body1,
              ),
            ),
            Text(
              '+10 EXP',
              style: AppTypography.caption.copyWith(color: AppColors.primary),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '적음',
          style: AppTypography.caption.copyWith(color: AppColors.textDisabled),
        ),
        AppSpacing.hXs,
        _buildLegendBox(AppColors.border),
        AppSpacing.hXs,
        _buildLegendBox(AppColors.primary.withValues(alpha: 0.1)),
        AppSpacing.hXs,
        _buildLegendBox(AppColors.primary.withValues(alpha: 0.4)),
        AppSpacing.hXs,
        _buildLegendBox(AppColors.primary.withValues(alpha: 0.7)),
        AppSpacing.hXs,
        _buildLegendBox(AppColors.primary),
        AppSpacing.hXs,
        Text(
          '많음',
          style: AppTypography.caption.copyWith(color: AppColors.textDisabled),
        ),
      ],
    );
  }

  Widget _buildLegendBox(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
