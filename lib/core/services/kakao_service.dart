import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';

/// 카카오 SDK 초기화 서비스
class KakaoService {
  static final Logger _logger = Logger();

  /// 카카오 SDK 초기화
  static Future<void> initialize() async {
    try {
      final kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'];

      if (kakaoNativeAppKey == null || kakaoNativeAppKey.isEmpty) {
        throw Exception('KAKAO_NATIVE_APP_KEY is not defined in .env file');
      }

      KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);

      _logger.i('✅ Kakao SDK initialized successfully');
      _logger.d('Kakao Native App Key: ${kakaoNativeAppKey.substring(0, 8)}...');
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Failed to initialize Kakao SDK',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// 카카오톡 설치 여부 확인
  static Future<bool> checkKakaoTalkInstalled() async {
    return await isKakaoTalkInstalled();
  }
}
