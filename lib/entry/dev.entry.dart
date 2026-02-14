import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/utils/logger.dart';
import '../core/theme/app_theme.dart';
import '../core/router/app_router.dart';

/// Development environment entry point
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  logger.i('Starting app in DEVELOPMENT mode');

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
