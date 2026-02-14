import 'package:flutter/material.dart';

/// 앱 전체 Border Radius 시스템
/// 일관된 둥근 모서리 처리를 위한 상수
class AppRadius {
  AppRadius._();

  // ==================== Radius Values ====================
  /// 최소 라운드 (4px)
  /// 사용: 아주 작은 요소
  static const double xs = 4.0;

  /// 작은 라운드 (8px)
  /// 사용: 작은 버튼, 태그
  static const double sm = 8.0;

  /// 중간 라운드 (12px)
  /// 사용: 일반 버튼, 입력 필드
  static const double md = 12.0;

  /// 큰 라운드 (16px)
  /// 사용: 카드, 모달
  static const double lg = 16.0;

  /// 아주 큰 라운드 (20px)
  /// 사용: 큰 카드, 하이라이트 영역
  static const double xl = 20.0;

  /// 최대 라운드 (24px)
  /// 사용: Pill 형태 버튼
  static const double xxl = 24.0;

  /// 원형 (50%)
  /// 사용: 아바타, 아이콘 컨테이너
  static const double circle = 999.0;

  // ==================== BorderRadius ====================
  /// 최소 BorderRadius
  static const BorderRadius borderXs = BorderRadius.all(Radius.circular(xs));

  /// 작은 BorderRadius
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));

  /// 중간 BorderRadius
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));

  /// 큰 BorderRadius
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));

  /// 아주 큰 BorderRadius
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));

  /// 최대 BorderRadius
  static const BorderRadius borderXxl = BorderRadius.all(Radius.circular(xxl));

  /// 원형 BorderRadius
  static const BorderRadius borderCircle = BorderRadius.all(Radius.circular(circle));

  // ==================== Custom BorderRadius ====================
  /// 상단만 둥글게
  static BorderRadius topOnly(double value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value),
      topRight: Radius.circular(value),
    );
  }

  /// 하단만 둥글게
  static BorderRadius bottomOnly(double value) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(value),
      bottomRight: Radius.circular(value),
    );
  }

  /// 왼쪽만 둥글게
  static BorderRadius leftOnly(double value) {
    return BorderRadius.only(
      topLeft: Radius.circular(value),
      bottomLeft: Radius.circular(value),
    );
  }

  /// 오른쪽만 둥글게
  static BorderRadius rightOnly(double value) {
    return BorderRadius.only(
      topRight: Radius.circular(value),
      bottomRight: Radius.circular(value),
    );
  }

  /// 개별 모서리 설정
  static BorderRadius custom({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  // ==================== Common Presets ====================
  /// 카드 BorderRadius (16px)
  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));

  /// 하이라이트 카드 BorderRadius (20px)
  static const BorderRadius cardHighlight = BorderRadius.all(Radius.circular(xl));

  /// 버튼 BorderRadius (24px - Pill 형태)
  static const BorderRadius button = BorderRadius.all(Radius.circular(xxl));

  /// 작은 버튼 BorderRadius (12px)
  static const BorderRadius buttonSmall = BorderRadius.all(Radius.circular(md));

  /// 입력 필드 BorderRadius (12px)
  static const BorderRadius input = BorderRadius.all(Radius.circular(md));

  /// 모달/바텀시트 상단 BorderRadius (20px)
  static BorderRadius get modalTop => topOnly(xl);

  /// 체크박스/아이콘 컨테이너 (원형)
  static const BorderRadius iconContainer = BorderRadius.all(Radius.circular(circle));

  // ==================== Radius (Circular) ====================
  /// Radius 객체 생성 헬퍼
  static Radius circular(double value) => Radius.circular(value);

  /// 타원형 Radius 생성
  static Radius elliptical(double x, double y) => Radius.elliptical(x, y);
}
