import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/utils/logger.dart';
import '../core/theme/app_theme.dart';
import '../core/router/app_router.dart';
import '../core/services/supabase_service.dart';
import '../core/services/kakao_service.dart';

/// Development environment entry point
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  logger.i('Starting app in DEVELOPMENT mode');

  try {
    // Load environment variables
    await dotenv.load(fileName: '.env');
    logger.i('✅ Environment variables loaded');

    // Initialize Supabase
    await SupabaseService.initialize();

    // Initialize Kakao SDK
    await KakaoService.initialize();

    logger.i('🚀 All services initialized successfully');
  } catch (e, stackTrace) {
    logger.e('Failed to initialize app', error: e, stackTrace: stackTrace);
    rethrow;
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mascot Todo (Dev)',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
