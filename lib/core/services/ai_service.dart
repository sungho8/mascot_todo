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
  /// [mascotName]: 현재 대화 중인 마스코트 이름
  Future<AiAnalysisModel> analyzeInput(String input, String mascotName) async {
    try {
      final prompt =
          '''
너는 Todo 리스트 앱의 마스코트 캐릭터 $mascotName야.
사용자의 입력을 분석해서 다음 JSON 형식으로 응답해줘.

분석 규칙:
1. 사용자의 입력이 새로운 할 일(TODO)을 추가하려는 의도인지, 아니면 그냥 대화나 다른 요청인지 판단해.
2. 할 일일 경우 "type": "todo"로 설정하고, "title"에 할 일 제목을 추출해.
3. 할 일의 카테고리를 다음 중 하나로 결정해서 "categoryId"에 넣어줘:
   - 'health': 운동, 건강, 식단 등
   - 'study': 공부, 학습, 독서 등
   - 'work': 업무, 작업, 프로젝트 등
   - 'mindfulness': 명상, 휴식, 일기, 마음챙김 등
   - 'habit': 생활 습관, 집안일, 루틴 등
   - 'hobby': 취미, 여가, 여행 등
4. 일반 대화일 경우 "type": "chat"으로 설정하고, "message"에 $mascotName의 성격과 말투(고양이 말투, ~냥!, ~야옹!)에 맞는 답변을 적어줘.
5. 할 일 추가 시에도 "message"에 추가했다는 확인 메시지를 $mascotName의 말투로 적어줘.

JSON 구조:
{
  "type": "todo" | "chat",
  "title": "추출된 할 일 제목 (todo인 경우에만)",
  "categoryId": "health" | "study" | "work" | "mindfulness" | "habit" | "hobby",
  "message": "사용자에게 보여줄 답변 메시지"
}

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
