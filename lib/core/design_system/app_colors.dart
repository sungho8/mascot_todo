import 'package:flutter/material.dart';

/// 앱 전체 색상 시스템
/// 디자인 가이드를 기반으로 정의된 색상 팔레트
class AppColors {
  AppColors._();

  // ==================== Primary Colors ====================
  /// 메인 민트 색상 (#4ECDC4)
  /// 사용: 체크마크, 활성 아이콘, 하단 네비게이션 활성화, 프로그레스 바
  static const Color primary = Color(0xFF4ECDC4);

  /// 다크 민트 색상 (Primary의 어두운 버전)
  /// 사용: 호버 상태, 강조
  static const Color primaryDark = Color(0xFF3DB8AF);

  /// 라이트 민트 색상 (Primary의 밝은 버전)
  /// 사용: 배경 강조, 비활성 상태
  static const Color primaryLight = Color(0xFF7EDDD8);

  // ==================== Background Colors ====================
  /// 메인 배경 색상 (#F5F5F5)
  static const Color background = Color(0xFFF5F5F5);

  /// 서브 배경 색상 (#EBEBEB)
  /// 사용: 구분선, 섹션 구분, 비활성 영역
  static const Color backgroundSecondary = Color(0xFFEBEBEB);

  /// 삼차 배경 색상 (#E0E0E0)
  /// 사용: 더 강한 구분이 필요한 영역
  static const Color backgroundTertiary = Color(0xFFE0E0E0);

  /// 카드 배경 색상 (흰색)
  static const Color cardBackground = Color(0xFFFFFFFF);

  /// 하이라이트 카드 배경 (#FFF9E6)
  /// 사용: "오늘의 집중" 같은 강조 카드
  static const Color highlightBackground = Color(0xFFFFF9E6);

  // ==================== Text Colors ====================
  /// 주요 텍스트 색상 (거의 검정)
  static const Color textPrimary = Color(0xFF1A1A1A);

  /// 보조 텍스트 색상 (회색)
  /// 사용: 부제목, 설명 텍스트
  static const Color textSecondary = Color(0xFF8B8B8B);

  /// 비활성 텍스트 색상
  static const Color textDisabled = Color(0xFFBDBDBD);

  /// 밝은 배경 위의 텍스트 (흰색)
  static const Color textOnDark = Color(0xFFFFFFFF);

  // ==================== Semantic Colors ====================
  /// 성공/완료 색상 (Primary와 동일)
  static const Color success = Color(0xFF4ECDC4);

  /// 경고 색상 (노란색)
  static const Color warning = Color(0xFFFFD700);

  /// 에러 색상 (빨간색)
  static const Color error = Color(0xFFFF6B6B);

  /// 정보 색상 (파란색)
  static const Color info = Color(0xFF4A90E2);

  // ==================== Button Colors ====================
  /// 프라이머리 버튼 배경 (검정)
  static const Color buttonPrimary = Color(0xFF1A1A1A);

  /// 세컨더리 버튼 배경 (흰색)
  static const Color buttonSecondary = Color(0xFFFFFFFF);

  /// 버튼 비활성 색상
  static const Color buttonDisabled = Color(0xFFE0E0E0);

  // ==================== Icon Colors ====================
  /// 활성 아이콘 색상 (Primary)
  static const Color iconActive = Color(0xFF4ECDC4);

  /// 비활성 아이콘 색상
  static const Color iconInactive = Color(0xFFBDBDBD);

  /// 다크 아이콘 색상
  static const Color iconDark = Color(0xFF1A1A1A);

  // ==================== Border Colors ====================
  /// 기본 보더 색상
  static const Color border = Color(0xFFE0E0E0);

  /// 포커스 보더 색상
  static const Color borderFocus = Color(0xFF4ECDC4);

  /// 에러 보더 색상
  static const Color borderError = Color(0xFFFF6B6B);

  // ==================== Overlay Colors ====================
  /// 다크 오버레이
  static final Color overlayDark = const Color(0xFF000000).withValues(alpha: 0.5);

  /// 라이트 오버레이
  static final Color overlayLight = const Color(0xFFFFFFFF).withValues(alpha: 0.5);

  // ==================== Gradient Colors ====================
  /// 프라이머리 그라디언트
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4ECDC4), Color(0xFF3DB8AF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ==================== Category Colors ====================
  /// 카테고리별 색상 (태그, 아이콘 등에 사용)
  static const Color categoryHealth = Color(0xFF4ECDC4);
  static const Color categoryWork = Color(0xFF4A90E2);
  static const Color categoryPersonal = Color(0xFFFFD700);
  static const Color categoryHobby = Color(0xFFFF6B6B);
  static const Color categoryStudy = Color(0xFF9B59B6);
}
