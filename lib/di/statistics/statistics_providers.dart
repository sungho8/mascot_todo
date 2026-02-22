import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../data/data_sources/remote/statistics/statistics_remote_data_source.dart';
import '../../data/repositories_impl/statistics/statistics_repository_impl.dart';
import '../../domain/repositories/statistics/statistics_repository.dart';
import '../../domain/usecases/statistics/get_statistics_data_usecase.dart';

part 'statistics_providers.g.dart';

/// Statistics Remote DataSource Provider
@riverpod
StatisticsRemoteDataSource statisticsRemoteDataSource(
  StatisticsRemoteDataSourceRef ref,
) {
  return StatisticsRemoteDataSource(Supabase.instance.client);
}

/// Statistics Repository Provider
@riverpod
StatisticsRepository statisticsRepository(StatisticsRepositoryRef ref) {
  return StatisticsRepositoryImpl(
    ref.watch(statisticsRemoteDataSourceProvider),
  );
}

/// Get Statistics Data UseCase Provider
@riverpod
GetStatisticsDataUseCase getStatisticsDataUseCase(
  GetStatisticsDataUseCaseRef ref,
) {
  return GetStatisticsDataUseCase(ref.watch(statisticsRepositoryProvider));
}
