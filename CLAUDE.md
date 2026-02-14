# Mascot Todo

## 프로젝트 개요

**Mascot Todo**는 할 일을 완료하여 귀여운 마스코트를 수집하고 성장시키는 게이미피케이션 기반 Todo 앱입니다.
Clean Architecture와 MVVM 패턴을 기반으로 한 Flutter 애플리케이션입니다.

> **기획 문서**: [docs/PRODUCT_SPEC.md](docs/PRODUCT_SPEC.md) - 서비스 개요, 핵심 시스템, 데이터 모델, 화면별 요구사항
> **Notion 원본**: Side Project > Mascot Todo > 상세 기획서

## 기술 스택 및 주요 특징

- **Clean Architecture** (3-Layer Architecture)
- **MVVM** 패턴
- **Riverpod**를 활용한 상태 관리
- **Freezed**를 활용한 불변 모델 및 Union Types
- **Either 패턴**을 통한 함수형 에러 핸들링
- **다국어 지원** (한국어, 영어, 일본어)
- **GoRouter**를 활용한 라우팅
- **Export** 사용

## 주요 기능

- ✅ Todo 관리 & 마스코트 매칭
- 🎨 마스코트 수집 및 성장 시스템
- 📊 달력 기반 통계 및 히트맵
- 🏆 업적 달성을 통한 마스코트 언락

# Flutter Clean Architecture Guide

> 상세 문서: [docs/PRODUCT_SPEC.md](docs/PRODUCT_SPEC.md) | [docs/PATTERNS.md](docs/PATTERNS.md) | [docs/UI_COMPONENTS.md](docs/UI_COMPONENTS.md)

## 스택

Flutter 3.38.5 | Dart 3.6+ | Riverpod 2.x | Freezed 3.0 | GoRouter | Dio | FVM

## 아키텍처

```
Clean Architecture | MVVM 패턴 | riverpod |
lib/
├── core/           # constants, exceptions, network, providers, services, utils, mixins
├── data/           # data_sources/(local|remote), models, repositories_impl
├── domain/         # entities, repositories(interface), usecases
├── presentation/   # viewmodels, views, widgets, mixins
├── di/             # 기능별 providers (auth/, device/, event/)
└── entry/          # dev.entry.dart, stg.entry.dart, prod.entry.dart
```

## 필수 명령어

```bash
fvm dart run build_runner build --delete-conflicting-outputs  # 코드 생성
flutter run -t lib/entry/dev.entry.dart                        # 개발 실행
```

## 코드 생성 트리거

`@freezed`, `@riverpod`, `@JsonSerializable()` 사용 파일 생성/수정 시 **반드시** build_runner 실행

- ❌ `flutter pub run build_runner build` 사용 금지
- ✅ `fvm dart run build_runner build --delete-conflicting-outputs` 사용
- ✅ fvm dart run ~ 실패 시 `fvm use 3.38.5` 사용 후 재 빌드

## 핵심 규칙

### Freezed 3.0

```dart
@freezed
abstract class UserEntity with _$UserEntity {  // ✅ abstract 필수
  const factory UserEntity({required String id}) = _UserEntity;
}
```

### 파일 분리

- **1 API 응답 = 1 Model 파일** (email_check_model.dart)
- **Model ↔ Entity 1:1 매칭**, 각각 별도 파일
- 전체 응답(code, data)과 data 내부는 같은 파일에 작성

### Export 규칙

```dart
// lib/domain/domain.dart, lib/di/di.dart
// - 알파벳순 정렬, 섹션별 구분 (/// entities, /// repositories, /// UseCase)
// - .freezed.dart, .g.dart 제외
```

### 데이터 흐름

```
View → ViewModel → UseCase → Repository → DataSource
         ↓
    데이터 수집(deviceInfo, networkInfo)은 ViewModel에서
    → UseCase/Repository는 파라미터로 받음
```

### Riverpod 사용

| 메서드       | 용도                          | 위치          |
| ------------ | ----------------------------- | ------------- |
| `ref.watch`  | 상태 구독 (리빌드)            | build()       |
| `ref.read`   | 일회성 읽기/메서드 호출       | 이벤트 핸들러 |
| `ref.listen` | 부수효과 (네비게이션, 스낵바) | build()       |

### 인증 처리

- **AuthInterceptor**: 토큰 주입만 (Infrastructure)
- **AuthErrorHandlerMixin**: 401/403 처리 (Presentation)
    - 401: 자동 토큰 갱신 → 재시도
    - 403: 토큰 삭제 → 로그아웃

### 에러 처리 체인

```
DataSource: DioException → ExceptionMapper → Exception
Repository: Exception → Either<Failure, Entity>
ViewModel: fold() → state.copyWith(errorMessage)
View: ref.listen → SnackbarHelper.showError()
```

### 필수 사용

- `const` 위젯, `AppSpace`, `AppTheme`, `AppConstants`
- `withValues(alpha: 0.5)` (withOpacity 금지)
- `RoutePath.login` (하드코딩 경로 금지)
- `SnackbarHelper`, `DialogHelper`

### 금지

- `Section` 네이밍 → 구체적 이름 사용
- 하드코딩 색상/크기/경로
- children 배열 위젯 간 빈 줄 없음 → 빈 줄 필수

### 네이밍

- 파일명: snake_case
- 클래스명: PascalCase
- 변수/함수명: camelCase
- 상수명: camelCase

## Service 래핑 규칙

- **래핑 필요**: device_info_plus, network_info_plus, geolocator, Firebase SDK
- **래핑 불필요**: riverpod, fpdart, logger, shared_preferences
- **예외**: AuthInterceptor는 FlutterSecureStorage 직접 사용 가능

## 새 기능 체크리스트

0. [ ] **swagger-spec.json에서 required 필드 확인** (필수 선행 단계!)
1. [ ] Entity (`domain/entities/{feature}/`) - required 필드 정확히 반영
2. [ ] Model + `toEntity()` (`data/models/{feature}/`) - required 필드 정확히 반영
3. [ ] Repository 인터페이스 (`domain/repositories/{feature}/`)
4. [ ] DataSource (`data/data_sources/remote/{feature}/`)
5. [ ] Repository 구현 (`data/repositories_impl/{feature}/`)
6. [ ] UseCase (`domain/usecases/{feature}/`)
7. [ ] State + Enum (`presentation/viewmodels/{feature}/`)
8. [ ] ViewModel + AuthErrorHandlerMixin
9. [ ] DI Provider (`di/{feature}/`)
10. [ ] Export 추가 (`domain.dart`, `di.dart`)
11. [ ] Build Runner 실행
12. [ ] View + ref.listen 에러 처리 + optional 필드 안전하게 처리

## 로깅

```dart
logger.d('Debug');   // API 요청/응답
logger.i('Info');    // 성공/일반 정보
logger.w('Warning'); // 경고 (401, 403)
logger.e('Error');   // 에러
```

---
