import 'package:flutter/material.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_typography.dart';
import '../design_system/app_radius.dart';

/// App-wide theme configuration
/// 새로운 디자인 시스템을 기반으로 구성된 테마
class AppTheme {
  AppTheme._();

  // ==================== Theme Data ====================
  /// Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        error: AppColors.error,
        surface: AppColors.cardBackground,
        onSurface: AppColors.textPrimary,
        surfaceContainerHighest: AppColors.background,
      ),

      scaffoldBackgroundColor: AppColors.background,

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.cardBackground,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.h3,
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.iconInactive,
        selectedLabelStyle: AppTypography.label,
        unselectedLabelStyle: AppTypography.label,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.card,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.textOnDark,
          elevation: 0,
          textStyle: AppTypography.buttonMedium,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border),
          textStyle: AppTypography.buttonMedium,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.button,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardBackground,
        border: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: const BorderSide(color: AppColors.borderFocus, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.input,
          borderSide: const BorderSide(color: AppColors.borderError),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: AppTypography.body1.copyWith(color: AppColors.textSecondary),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.border;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.textOnDark,
        elevation: 4,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        error: AppColors.error,
        surface: Color(0xFF1e1e1e),
        onSurface: Color(0xFFFFFFFF),
        surfaceContainerHighest: Color(0xFF121212),
      ),

      scaffoldBackgroundColor: const Color(0xFF121212),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1e1e1e),
        foregroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1e1e1e),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFFBDBDBD),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }

  // ==================== Backward Compatibility ====================
  // 기존 코드와의 호환성을 위해 유지 (추후 제거 예정)

  @Deprecated('Use AppColors.primary instead')
  static const Color primaryColor = AppColors.primary;

  @Deprecated('Use AppColors.warning instead')
  static const Color secondaryColor = AppColors.warning;

  @Deprecated('Use AppColors.error instead')
  static const Color errorColor = AppColors.error;

  @Deprecated('Use AppColors.success instead')
  static const Color successColor = AppColors.success;

  @Deprecated('Use AppColors.warning instead')
  static const Color warningColor = AppColors.warning;

  @Deprecated('Use AppColors.textSecondary instead')
  static const Color grey_600 = AppColors.textSecondary;

  @Deprecated('Use AppColors.iconInactive instead')
  static const Color grey_500 = AppColors.iconInactive;

  @Deprecated('Use AppTypography.h1 instead')
  static const TextStyle headlineLarge = AppTypography.h1;

  @Deprecated('Use AppTypography.h2 instead')
  static const TextStyle headlineMedium = AppTypography.h2;

  @Deprecated('Use AppTypography.h4 instead')
  static const TextStyle titleMedium = AppTypography.h4;

  @Deprecated('Use AppTypography.body1 instead')
  static const TextStyle bodyMedium = AppTypography.body1;
}
