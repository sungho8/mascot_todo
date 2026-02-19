import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase 초기화 서비스
class SupabaseService {
  static final Logger _logger = Logger();

  /// Supabase 초기화
  static Future<void> initialize() async {
    try {
      final supabaseUrl = dotenv.env['SUPABASE_URL'];
      final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

      if (supabaseUrl == null || supabaseUrl.isEmpty) {
        throw Exception('SUPABASE_URL is not defined in .env file');
      }

      if (supabaseAnonKey == null || supabaseAnonKey.isEmpty) {
        throw Exception('SUPABASE_ANON_KEY is not defined in .env file');
      }

      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseAnonKey,
        debug: true, // 개발 환경에서 로그 활성화
      );

      _logger.i('✅ Supabase initialized successfully');
      _logger.d('Supabase URL: $supabaseUrl');
    } catch (e, stackTrace) {
      _logger.e(
        '❌ Failed to initialize Supabase',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Supabase 클라이언트 인스턴스
  static SupabaseClient get client => Supabase.instance.client;

  /// 현재 로그인된 사용자
  static User? get currentUser => client.auth.currentUser;

  /// 인증 상태 변경 스트림
  static Stream<AuthState> get authStateChanges =>
      client.auth.onAuthStateChange;
}
