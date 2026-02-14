import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 앱 전체 타이포그래피 시스템
/// 디자인 가이드를 기반으로 정의된 텍스트 스타일
class AppTypography {
  AppTypography._();

  /// 기본 폰트 패밀리
  static const String _fontFamily = 'Pretendard';

  // ==================== Headings ====================
  /// H1: 큰 제목 (28px, Bold)
  /// 사용: "UI디자인 마무리하기" 같은 메인 강조 텍스트
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 1.3,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  /// H2: 중간 제목 (22px, Bold)
  /// 사용: "좋은 아침이에요, Alex님!" 같은 인사말
  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    height: 1.3,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );

  /// H3: 작은 제목 (18px, SemiBold)
  /// 사용: 섹션 제목
  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );

  /// H4: 미니 제목 (16px, SemiBold)
  /// 사용: "물 2L 마시기" 같은 태스크 제목
  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: -0.1,
  );

  // ==================== Subtitles ====================
  /// Subtitle 1: 큰 서브타이틀 (14px, Medium)
  /// 사용: "오늘의 집중" 같은 섹션 라벨
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// Subtitle 2: 작은 서브타이틀 (14px, Regular)
  /// 사용: "Lv. 12 마스코트는 마스터" 같은 부가 정보
  static const TextStyle subtitle2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ==================== Body Text ====================
  /// Body 1: 일반 본문 (14px, Regular)
  /// 사용: 일반 설명 텍스트
  static const TextStyle body1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// Body 2: 작은 본문 (12px, Regular)
  /// 사용: "건강 & 웰니스" 같은 카테고리 라벨
  static const TextStyle body2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // ==================== Caption & Labels ====================
  /// Caption: 캡션 텍스트 (12px, Medium)
  /// 사용: "3/5 완료", "레벨 13까지 75%" 같은 진행 상태
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  /// Label: 라벨 텍스트 (10px, Medium)
  /// 사용: 하단 네비게이션 라벨, 작은 태그
  static const TextStyle label = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // ==================== Button Text ====================
  /// Button Large: 큰 버튼 텍스트 (16px, SemiBold)
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    letterSpacing: 0.5,
  );

  /// Button Medium: 중간 버튼 텍스트 (14px, SemiBold)
  /// 사용: "집중 시작" 같은 액션 버튼
  static const TextStyle buttonMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnDark,
    letterSpacing: 0.3,
  );

  /// Button Small: 작은 버튼 텍스트 (12px, Medium)
  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.textOnDark,
  );

  // ==================== Special Text Styles ====================
  /// 오버라인: 상단 작은 라벨 (10px, Medium, Uppercase)
  /// 사용: "TODAY", "LEVEL UP" 같은 태그
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 1.5,
  );

  /// 숫자 강조: 큰 숫자 표시 (32px, Bold)
  /// 사용: 레벨, 카운트 등
  static const TextStyle numberEmphasis = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  // ==================== Utility Methods ====================
  /// 텍스트 색상 변경
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// 텍스트 굵기 변경
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// 텍스트 크기 변경
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }
}
