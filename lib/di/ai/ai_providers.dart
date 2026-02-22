import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/services/ai_service.dart';
import '../../data/repositories_impl/ai/ai_repository_impl.dart';
import '../../domain/repositories/ai/ai_repository.dart';
import '../../domain/usecases/ai/process_chat_usecase.dart';
import '../home/home_providers.dart';

/// AI 서비스 프로바이더
final aiServiceProvider = Provider<AIService>((ref) {
  return AIService();
});

/// AI 저장소 프로바이더
final aiRepositoryProvider = Provider<AIRepository>((ref) {
  final aiService = ref.watch(aiServiceProvider);
  return AIRepositoryImpl(aiService);
});

/// AI 채팅 처리 유스케이스 프로바이더
final processChatUseCaseProvider = Provider<ProcessChatUseCase>((ref) {
  final aiRepository = ref.watch(aiRepositoryProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);
  return ProcessChatUseCase(aiRepository, categoryRepository);
});
