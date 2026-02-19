import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/utils/logger.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/services/supabase_service.dart';
import 'core/services/kakao_service.dart';

/// Main entry point (development)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  logger.i('Starting Mascot Todo app');

  try {
    await dotenv.load(fileName: '.env');
    logger.i('✅ Environment variables loaded');

    await SupabaseService.initialize();

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
      title: 'Mascot Todo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
