import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../di/statistics/statistics_providers.dart';
import '../../../../di/auth/auth_providers.dart';
import 'statistics_state.dart';

part 'statistics_viewmodel.g.dart';

@riverpod
class StatisticsViewModel extends _$StatisticsViewModel {
  @override
  StatisticsState build() {
    Future.microtask(() => loadData());
    return const StatisticsState();
  }

  Future<void> loadData() async {
    state = state.copyWith(
      status: StatisticsStatus.loading,
      errorMessage: null,
    );

    final userResult = await ref.read(getCurrentUserUseCaseProvider)();

    final user = userResult.fold((failure) {
      state = state.copyWith(
        status: StatisticsStatus.error,
        errorMessage: '사용자 정보를 불러오지 못했습니다.',
      );
      return null;
    }, (user) => user);

    if (user == null) {
      if (state.status != StatisticsStatus.error) {
        state = state.copyWith(
          status: StatisticsStatus.error,
          errorMessage: '로그인이 필요합니다.',
        );
      }
      return;
    }

    final now = DateTime.now();
    // 히트맵용 과거 6개월 데이터 로드
    final heatmapStart = DateTime(now.year, now.month - 5, 1);
    final heatmapEnd = DateTime(now.year, now.month + 1, 0);

    // 습관 (주간 기준 월요일부터 일요일)
    final habitWeekStart = now.subtract(Duration(days: now.weekday - 1));

    final usecase = ref.read(getStatisticsDataUseCaseProvider);
    final result = await usecase(
      userId: user.id,
      heatmapStart: heatmapStart,
      heatmapEnd: heatmapEnd,
      habitWeekStart: habitWeekStart,

      hourlyStart: null,
      hourlyEnd: null,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          status: StatisticsStatus.error,
          errorMessage: failure.when(
            serverError: (msg) => msg ?? '통계 데이터를 불러오지 못했습니다.',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요.',
            cacheError: (msg) => msg ?? '데이터 오류.',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다.',
          ),
        );
      },
      (data) {
        state = state.copyWith(
          status: StatisticsStatus.loaded,
          heatmapData: data.heatmapData,

          hourlyStats: data.hourlyStats,
          habitStats: data.habitStats,
          mascotGrowthStats: data.mascotGrowthStats,
          weeklyComparison: data.weeklyComparison,
        );

        if (state.selectedDate != null) {
          selectDate(state.selectedDate!);
        }
      },
    );
  }

  Future<void> selectDate(DateTime date) async {
    state = state.copyWith(selectedDate: date, errorMessage: null);

    final userResult = await ref.read(getCurrentUserUseCaseProvider)();
    final user = userResult.fold((_) => null, (user) => user);

    if (user == null) return;

    final res = await ref
        .read(statisticsRepositoryProvider)
        .getDayDetail(userId: user.id, date: date);
    res.fold(
      (failure) {
        state = state.copyWith(
          errorMessage: failure.when(
            serverError: (msg) => msg ?? '일별 상세 데이터를 불러오지 못했습니다.',
            networkError: (msg) => msg ?? '네트워크 연결을 확인해주세요.',
            cacheError: (msg) => msg ?? '데이터 오류.',
            unknownError: (msg) => msg ?? '알 수 없는 오류가 발생했습니다.',
          ),
        );
      },
      (details) {
        state = state.copyWith(dayDetails: details);
      },
    );
  }

  void setMonthOffset(int offset) {
    state = state.copyWith(selectedMonth: offset);
  }
}
