import 'package:flutter/material.dart';

/// 앱 전체 간격 시스템
/// 일관된 레이아웃과 간격을 위한 상수 및 위젯
class AppSpacing {
  AppSpacing._();

  // ==================== Spacing Values ====================
  /// 최소 간격 (4px)
  static const double xs = 4.0;

  /// 작은 간격 (8px)
  static const double sm = 8.0;

  /// 중간 간격 (16px)
  static const double md = 16.0;

  /// 큰 간격 (32px)
  static const double lg = 32.0;

  /// 최대 간격 (64px)
  static const double xl = 64.0;

  // 하위 호환성을 위한 별칭 (점진적 제거 권장)
  static const double xxs = xs;
  static const double xxl = lg;
  static const double xxxl = xl;

  // ==================== Horizontal Spacing (SizedBox) ====================
  /// 최소 가로 간격
  static const SizedBox hXs = SizedBox(width: xs);

  /// 작은 가로 간격
  static const SizedBox hSm = SizedBox(width: sm);

  /// 중간 가로 간격
  static const SizedBox hMd = SizedBox(width: md);

  /// 큰 가로 간격
  static const SizedBox hLg = SizedBox(width: lg);

  /// 최대 가로 간격
  static const SizedBox hXl = SizedBox(width: xl);

  // 하위 호환성용
  static const SizedBox hXxs = hXs;
  static const SizedBox hXxl = hLg;
  static const SizedBox hXxxl = hXl;

  // ==================== Vertical Spacing (SizedBox) ====================
  /// 최소 세로 간격
  static const SizedBox vXs = SizedBox(height: xs);

  /// 작은 세로 간격
  static const SizedBox vSm = SizedBox(height: sm);

  /// 중간 세로 간격
  static const SizedBox vMd = SizedBox(height: md);

  /// 큰 세로 간격
  static const SizedBox vLg = SizedBox(height: lg);

  /// 최대 세로 간격
  static const SizedBox vXl = SizedBox(height: xl);

  // 하위 호환성용
  static const SizedBox vXxs = vXs;
  static const SizedBox vXxl = vLg;
  static const SizedBox vXxxl = vXl;

  // ==================== Padding ====================
  /// 모든 방향 동일 패딩
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// 가로 패딩
  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  /// 세로 패딩
  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

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
  /// 화면 가로 패딩 (16px)
  static const EdgeInsets screenHorizontal = EdgeInsets.symmetric(
    horizontal: md,
  );

  /// 화면 세로 패딩 (32px)
  static const EdgeInsets screenVertical = EdgeInsets.symmetric(vertical: lg);

  /// 프리미엄 레이아웃 기본 패딩 (32px)
  static const EdgeInsets screenAll = EdgeInsets.all(lg);

  /// 카드 내부 패딩 (16px)
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// 하위 호환성용
  static const EdgeInsets cardPaddingLarge = screenAll;

  /// 리스트 아이템 패딩 (16px 가로, 8px 세로)
  static const EdgeInsets listItem = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// 버튼 내부 패딩 (16px 가로, 16px 세로)
  static const EdgeInsets button = EdgeInsets.symmetric(
    horizontal: md,
    vertical: md,
  );

  // ==================== Icon Sizes ====================
  /// 작은 아이콘 (16px)
  static const double iconXs = 16.0;

  /// 중간 아이콘 (32px)
  static const double iconSm = 32.0;

  /// 일반 아이콘 (32px)
  static const double iconMd = 32.0;

  /// 큰 아이콘 (64px)
  static const double iconLg = 64.0;

  /// 아주 큰 아이콘 (64px)
  static const double iconXl = 64.0;

  /// 하위 호환성용
  static const double iconXxl = iconLg;
}
