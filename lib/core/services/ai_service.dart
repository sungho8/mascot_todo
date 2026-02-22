import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:logger/logger.dart';
import '../../data/models/ai/ai_analysis_model.dart';

/// AI 서비스
/// Gemini API를 사용하여 TODO 추출 및 대화 생성
class AIService {
  AIService() {
    final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
    if (apiKey.isEmpty || apiKey == 'YOUR_GEMINI_API_KEY_HERE') {
      _logger.w('Gemini API Key가 설정되지 않았습니다. .env 파일을 확인해주세요.');
    }
    // 성능 최적화를 위해 Flash Lite 모델 사용 (지연 시간 대폭 감소)
    _model = GenerativeModel(
      model: 'gemini-flash-lite-latest',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: 0.7,
      ),
    );
  }

  late final GenerativeModel _model;
  final _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // 스택트레이스 숨기기
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
  );

  /// 사용자의 입력을 분석하여 결과 반환
  /// [input]: 사용자 메시지
  /// [systemPrompt]: 마스코트별 고유 페르소나가 포함된 시스템 지침
  Future<AiAnalysisModel> analyzeInput(
    String input,
    String systemPrompt,
  ) async {
    try {
      final prompt =
          '''
$systemPrompt

사용자 입력: "$input"
''';

      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text;

      if (text == null) {
        throw Exception('AI 응답이 비어있습니다.');
      }

      _logger.d('전송된 프롬프트: $prompt');
      _logger.i('AI 원본 응답: $text');

      // Gemini가 JSON 모드임에도 ```json ... ``` 형식을 반환할 경우를 대비하여 정제
      String cleanedText = text.trim();
      if (cleanedText.contains('```json')) {
        cleanedText = cleanedText.split('```json')[1].split('```')[0].trim();
      } else if (cleanedText.contains('```')) {
        cleanedText = cleanedText.split('```')[1].split('```')[0].trim();
      }

      final json = jsonDecode(cleanedText) as Map<String, dynamic>;
      return AiAnalysisModel.fromJson(json);
    } catch (e, stackTrace) {
      _logger.e('AI 분석 중 오류 발생', error: e, stackTrace: stackTrace);
      return AiAnalysisModel(
        type: 'chat',
        message: '미안해, 지금은 조금 정신이 없어… 나중에 다시 말해줄래?',
      );
    }
  }
}
