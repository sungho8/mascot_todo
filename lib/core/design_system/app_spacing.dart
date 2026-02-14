import 'package:flutter/material.dart';

/// 앱 전체 간격 시스템
/// 일관된 레이아웃과 간격을 위한 상수 및 위젯
class AppSpacing {
  AppSpacing._();

  // ==================== Spacing Values ====================
  /// 최소 간격 (4px)
  /// 사용: 매우 작은 요소 간 간격
  static const double xxs = 4.0;

  /// 아주 작은 간격 (8px)
  /// 사용: 인접한 요소 간 간격
  static const double xs = 8.0;

  /// 작은 간격 (12px)
  /// 사용: 관련된 요소 그룹 간 간격
  static const double sm = 12.0;

  /// 중간 간격 (16px)
  /// 사용: 카드 내부 패딩, 리스트 아이템 간격
  static const double md = 16.0;

  /// 큰 간격 (20px)
  /// 사용: 카드 패딩, 섹션 간 간격
  static const double lg = 20.0;

  /// 아주 큰 간격 (24px)
  /// 사용: 주요 섹션 간 간격
  static const double xl = 24.0;

  /// 최대 간격 (32px)
  /// 사용: 화면 상단/하단 여백
  static const double xxl = 32.0;

  /// 초대형 간격 (48px)
  /// 사용: 특별한 강조가 필요한 여백
  static const double xxxl = 48.0;

  // ==================== Horizontal Spacing (SizedBox) ====================
  /// 최소 가로 간격
  static const SizedBox hXxs = SizedBox(width: xxs);

  /// 아주 작은 가로 간격
  static const SizedBox hXs = SizedBox(width: xs);

  /// 작은 가로 간격
  static const SizedBox hSm = SizedBox(width: sm);

  /// 중간 가로 간격
  static const SizedBox hMd = SizedBox(width: md);

  /// 큰 가로 간격
  static const SizedBox hLg = SizedBox(width: lg);

  /// 아주 큰 가로 간격
  static const SizedBox hXl = SizedBox(width: xl);

  /// 최대 가로 간격
  static const SizedBox hXxl = SizedBox(width: xxl);

  /// 초대형 가로 간격
  static const SizedBox hXxxl = SizedBox(width: xxxl);

  // ==================== Vertical Spacing (SizedBox) ====================
  /// 최소 세로 간격
  static const SizedBox vXxs = SizedBox(height: xxs);

  /// 아주 작은 세로 간격
  static const SizedBox vXs = SizedBox(height: xs);

  /// 작은 세로 간격
  static const SizedBox vSm = SizedBox(height: sm);

  /// 중간 세로 간격
  static const SizedBox vMd = SizedBox(height: md);

  /// 큰 세로 간격
  static const SizedBox vLg = SizedBox(height: lg);

  /// 아주 큰 세로 간격
  static const SizedBox vXl = SizedBox(height: xl);

  /// 최대 세로 간격
  static const SizedBox vXxl = SizedBox(height: xxl);

  /// 초대형 세로 간격
  static const SizedBox vXxxl = SizedBox(height: xxxl);

  // ==================== Padding ====================
  /// 모든 방향 동일 패딩
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// 가로 패딩
  static EdgeInsets horizontal(double value) => EdgeInsets.symmetric(horizontal: value);

  /// 세로 패딩
  static EdgeInsets vertical(double value) => EdgeInsets.symmetric(vertical: value);

  /// 대칭 패딩
  static EdgeInsets symmetric({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    );
  }

  /// 개별 패딩
  static EdgeInsets only({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return EdgeInsets.only(
      left: left ?? 0,
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
    );
  }

  // ==================== Common Padding Presets ====================
  /// 화면 가로 패딩 (20px)
  static const EdgeInsets screenHorizontal = EdgeInsets.symmetric(horizontal: lg);

  /// 화면 세로 패딩 (24px)
  static const EdgeInsets screenVertical = EdgeInsets.symmetric(vertical: xl);

  /// 화면 전체 패딩 (20px)
  static const EdgeInsets screenAll = EdgeInsets.all(lg);

  /// 카드 내부 패딩 (16px)
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// 카드 큰 패딩 (20px)
  static const EdgeInsets cardPaddingLarge = EdgeInsets.all(lg);

  /// 리스트 아이템 패딩 (16px 가로, 12px 세로)
  static const EdgeInsets listItem = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// 버튼 내부 패딩 (20px 가로, 16px 세로)
  static const EdgeInsets button = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  /// 작은 버튼 내부 패딩 (16px 가로, 12px 세로)
  static const EdgeInsets buttonSmall = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  // ==================== Icon Sizes ====================
  /// 작은 아이콘 (16px)
  static const double iconXs = 16.0;

  /// 중간 아이콘 (24px)
  /// 사용: 체크박스, 작은 아이콘
  static const double iconSm = 24.0;

  /// 일반 아이콘 (32px)
  static const double iconMd = 32.0;

  /// 큰 아이콘 (48px)
  /// 사용: 마스코트 아이콘
  static const double iconLg = 48.0;

  /// 아주 큰 아이콘 (64px)
  static const double iconXl = 64.0;

  /// 최대 아이콘 (80px)
  static const double iconXxl = 80.0;
}
