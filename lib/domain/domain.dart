/// Domain layer exports
/// CLAUDE.md: 알파벳순 정렬, 섹션별 구분, .freezed.dart/.g.dart 제외
library;

/// Entities
export 'entities/ai/ai_analysis_entity.dart';
export 'entities/auth/user_entity.dart';
export 'entities/statistics/day_detail_entity.dart';
export 'entities/statistics/habit_stat_entity.dart';
export 'entities/statistics/heatmap_data_entity.dart';
export 'entities/statistics/hourly_stat_entity.dart';
export 'entities/statistics/mascot_growth_stat_entity.dart';
export 'entities/statistics/weekly_comparison_entity.dart';

/// Repositories
export 'repositories/ai/ai_repository.dart';
export 'repositories/auth/auth_repository.dart';
export 'repositories/statistics/statistics_repository.dart';

/// UseCases
export 'usecases/ai/process_chat_usecase.dart';
export 'usecases/auth/get_current_user_usecase.dart';
export 'usecases/auth/sign_in_with_kakao_usecase.dart';
export 'usecases/auth/sign_out_usecase.dart';
export 'usecases/statistics/get_statistics_data_usecase.dart';
