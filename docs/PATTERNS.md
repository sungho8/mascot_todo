# 상세 코드 패턴

## DI Provider 패턴

### DI 디렉토리 구조
```
lib/di/
├── di.dart                    # 전체 DI export
├── auth/
│   ├── auth_providers.dart
│   ├── registration_providers.dart
│   └── account_recovery_providers.dart
├── device/
│   └── device_providers.dart
└── event/
    └── event_popup_providers.dart
```

### Provider 파일 구조
```dart
// lib/di/{feature}/{feature}_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{feature}_providers.g.dart';

/// ==================== Data Sources ====================

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dio = ref.read(dioProvider);
  return AuthRemoteDataSourceImpl(dio: dio);
}

@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  final secureStorage = ref.read(secureStorageProvider);
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return AuthLocalDataSourceImpl(
    secureStorage: secureStorage,
    sharedPreferences: sharedPreferences,
  );
}

/// ==================== Repositories ====================

@riverpod
AuthRepository authRepository(Ref ref) {
  final localDataSource = ref.read(authLocalDataSourceProvider);
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(
    localDataSource: localDataSource,
    remoteDataSource: remoteDataSource,
  );
}

/// ==================== Use Cases ====================

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LoginUseCase(authRepository);
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LogoutUseCase(authRepository);
}
```

### DI Export 규칙
```dart
// lib/di/di.dart
library;

/// ==================== Auth ====================
export 'auth/account_recovery_providers.dart';
export 'auth/auth_providers.dart';
export 'auth/registration_providers.dart';

/// ==================== Device ====================
export 'device/device_providers.dart';

/// ==================== Event ====================
export 'event/event_popup_providers.dart';
```

**규칙:**
- 기능별로 섹션 구분
- 알파벳 순서로 정렬
- 생성 파일(`.g.dart`)은 export 하지 않음

### Provider Override 패턴
```dart
// lib/core/providers/storage_providers.dart
@riverpod
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('SharedPreferences must be overridden');
}

// lib/main.dart
Future<void> main(name) async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const App(),
    ),
  );
}
```

**Override 대상:**
- `SharedPreferences` (비동기 초기화 필요)
- 테스트 시 Mock 객체 주입 필요한 Provider

### Core Providers vs DI Providers
- **Core Providers** (`lib/core/providers/`): 전역 인프라 (dioProvider, secureStorageProvider, networkInfoProvider)
- **DI Providers** (`lib/di/`): 기능별 (authRepository, loginUseCase, deviceRepository)

---

## Export 규칙 상세

### domain.dart
```dart
// lib/domain/domain.dart
library;

/// entities
export 'entities/auth/auth_token_entity.dart';
export 'entities/auth/email_check_entity.dart';
export 'entities/device/device_payload_entity.dart';
export 'entities/webview/cookie_payload_entity.dart';

/// repositories
export 'repositories/auth/auth_repository.dart';
export 'repositories/event/event_popup_repository.dart';

/// UseCase
export 'usecases/auth/login_usecase.dart';
export 'usecases/auth/logout_usecase.dart';
```

**규칙:**
1. 섹션별로 구분 (`/// entities`, `/// repositories`, `/// UseCase`)
2. 알파벳 순서로 정렬 (디렉토리명 → 파일명)
3. `.freezed.dart`, `.g.dart` 파일 export 금지
4. 새로운 Entity/Repository/UseCase 생성 시 **반드시** export 추가

---

## State 클래스 패턴

### State 파일 구조
```
lib/presentation/viewmodels/{feature}/
├── {feature}_viewmodel.dart
└── {feature}_state.dart
```

### State 클래스 작성 규칙
```dart
// lib/presentation/viewmodels/login/login_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus {  // {ScreenName}Status 형식
  initial,
  loading,
  success,
  error,
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required LoginStatus status,
    String? errorMessage,  // 항상 nullable
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    email: '',
    password: '',
    status: .initial,
  );
}
```

**Enum 네이밍 규칙:**
- `{ScreenName}Status` 형식
- 값: `initial`, `loading`, `success`, `error`
- 추가 상태 가능: `submitting`, `validating` 등

### 복잡한 State 예시
```dart
enum DeviceStatus { initial, loading, success, error }

@freezed
abstract class DeviceState with _$DeviceState {
  const factory DeviceState({
    required DeviceStatus status,
    required List<DeviceEntity> devices,
    required int registeredCount,
    required int maxCount,
    String? errorMessage,
    String? errorCode,
    DeviceEntity? selectedDevice,
  }) = _DeviceState;

  factory DeviceState.initial() => const DeviceState(
    status: .initial,
    devices: [],
    registeredCount: 0,
    maxCount: 0,
  );
}
```

### State 업데이트 패턴
```dart
// 단일 필드
state = state.copyWith(email: newEmail);

// 여러 필드
state = state.copyWith(
  status: .success,
  errorMessage: null,  // 에러 초기화
);

// 리스트
state = state.copyWith(
  devices: [...state.devices, newDevice],
);
```

### 주의사항
1. State는 항상 불변 - `copyWith()`로만 업데이트, 직접 수정 금지
2. 에러 초기화 - 새 요청 시 `errorMessage: null`로 초기화
3. Loading 상태 관리 - API 호출 전: `status = loading`, 완료 후: `success` 또는 `error`
4. Freezed 생성 파일 - State 파일 수정 후 반드시 Build Runner 실행

---

## ViewModel 패턴

### 기본 구조
```dart
@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => LoginState.initial();

  void changedEmail(String email) {
    state = state.copyWith(email: email);
  }

  Future<void> login() async {
    state = state.copyWith(status: .loading);

    final result = await loginUseCase(...);

    result.fold(
      (failure) => state = state.copyWith(
        status: .error,
        errorMessage: failure.message,
      ),
      (auth) => state = state.copyWith(status: .success),
    );
  }

  void clearError() {
    state = state.copyWith(
      status: .initial,
      errorMessage: null,
    );
  }
}
```

### JWT API 사용 ViewModel (AuthErrorHandlerMixin)

**표준 구현 순서:**
1. 로딩 상태 설정
2. 현재 사용자 확인 (필요한 경우)
3. 데이터 수집 (디바이스 정보, 네트워크 정보 등)
4. UseCase 호출
5. handleAuthError로 401/403 처리
6. 결과 처리 (fold)
7. catch로 예외 처리

```dart
@riverpod
class DeviceViewModel extends _$DeviceViewModel with AuthErrorHandlerMixin {
  @override
  DeviceState build() => DeviceState.initial();

  Future<void> deleteDevice({required String deviceIdentifier}) async {
    // 1. 로딩 상태
    state = state.copyWith(status: .loading);

    try {
      // 2. 현재 사용자 확인
      final currentUser = ref.read(currentUserProvider);
      if (currentUser == null) {
        state = state.copyWith(
          status: .error,
          errorMessage: '로그인이 필요합니다.',
          errorCode: null,
        );
        return;
      }

      // 3. 데이터 수집
      final fcmToken = await ref.read(getFcmTokenProvider.future);
      final userDeviceInfo = await ref.read(userDeviceInfoProvider.future);

      // 4. UseCase 호출
      final deleteDeviceUseCase = ref.read(deleteDeviceUseCaseProvider);
      final result = await deleteDeviceUseCase(
        userDeviceInfo: userDeviceInfo.copyWith(fcmToken: fcmToken ?? ''),
        selectIdentifier: deviceIdentifier,
      );

      // 5. handleAuthError로 401/403 처리
      final handled = await handleAuthError(
        ref: ref,
        result: result,
        retry: () => deleteDeviceUseCase(
          userDeviceInfo: userDeviceInfo.copyWith(fcmToken: fcmToken ?? ''),
          selectIdentifier: deviceIdentifier,
        ),
      );

      // 6. 결과 처리
      handled.fold(
        (failure) => state = state.copyWith(
          status: .error,
          errorMessage: failure.message,
          errorCode: failure.code,
        ),
        (_) {
          state = state.copyWith(status: .success, errorMessage: null, errorCode: null);
          getRegisteredDevices();  // 목록 새로고침
        },
      );
    } catch (e) {
      // 7. 예외 처리
      state = state.copyWith(status: .error, errorMessage: e.toString(), errorCode: null);
      logger.e('Delete device error: $e');
    }
  }
}
```

**핵심 포인트:**
- ✅ 반드시 `handleAuthError` 사용: 모든 JWT API 호출 후 감싸야 함
- ✅ retry 함수에 동일한 파라미터 전달: 원래 요청과 완전히 동일하게
- ✅ errorCode 저장: State에 `errorCode` 필드가 있으면 함께 저장
- ✅ try-catch로 예외 처리: 예상치 못한 에러도 처리

---

## View 패턴

### ConsumerWidget vs ConsumerStatefulWidget
```dart
// ConsumerWidget: 로컬 상태 불필요
class SimpleView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(someProvider);
    return Text('$state');
  }
}

// ConsumerStatefulWidget: 로컬 상태 필요
class StatefulView extends ConsumerStatefulWidget {
  @override
  ConsumerState<StatefulView> createState() => _StatefulViewState();
}

class _StatefulViewState extends ConsumerState<StatefulView> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(someProvider.notifier);
    return Text('$_counter');
  }
}
```

### View 에러 처리 패턴
```dart
class DeviceView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deviceViewModelProvider);

    // ✅ 필수: ref.listen으로 에러 처리
    ref.listen(deviceViewModelProvider, (previous, next) {
      if (next.status == .error) {
        // 세션 만료 감지 (contains 사용)
        final isSessionExpired =
          next.errorMessage?.contains('세션이 만료') == true ||
          next.errorMessage?.contains('다시 로그인') == true;

        if (isSessionExpired) {
          context.go(RoutePath.login);
          SnackbarHelper.showError(context, next.errorMessage!);
        } else {
          SnackbarHelper.showError(context, next.errorMessage ?? '오류가 발생했습니다.');
        }

        ref.read(deviceViewModelProvider.notifier).clearError();
      }
    });

    return Scaffold(body: _buildBody(state));
  }

  Widget _buildBody(DeviceState state) {
    switch (state.status) {
      case .initial:
      case .loading:
        return const Center(child: CircularProgressIndicator());
      case .success:
        return DeviceList(deviceState: state);
      case .error:
        return ErrorWidget(errorMessage: state.errorMessage);
    }
  }
}
```

### View 에러 처리 체크리스트
- [ ] `ref.listen`으로 ViewModel 상태 변화 감지
- [ ] `.error` 상태일 때 에러 처리
- [ ] 세션 만료 메시지 감지 (`contains` 사용)
- [ ] 세션 만료 시 로그인 화면 이동
- [ ] 일반 에러는 스낵바로 표시
- [ ] 에러 메시지 초기화 (선택적)

---

## Model 패턴

### Model 파일 구조
```dart
// lib/data/models/auth/email_check_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/domain.dart';

part 'email_check_model.freezed.dart';
part 'email_check_model.g.dart';

/// 전체 응답 Model
@freezed
abstract class EmailCheckModel with _$EmailCheckModel {
  const EmailCheckModel._();  // 커스텀 메서드용

  const factory EmailCheckModel({
    required EmailCheckDataModel data,
    required String code,
    String? message,
  }) = _EmailCheckModel;

  factory EmailCheckModel.fromJson(Map<String, dynamic> json) =>
      _$EmailCheckModelFromJson(json);

  EmailCheckEntity toEntity() {
    return EmailCheckEntity(
      data: data.toEntity(),
      code: code,
      message: message,
    );
  }
}

/// data 내부 Model (같은 파일에 작성)
@freezed
abstract class EmailCheckDataModel with _$EmailCheckDataModel {
  const EmailCheckDataModel._();

  const factory EmailCheckDataModel({
    @JsonKey(name: 'is_duplicated') required bool isDuplicated,
    @JsonKey(name: 'is_withdrawn_recently') required bool isWithdrawnRecently,
  }) = _EmailCheckDataModel;

  factory EmailCheckDataModel.fromJson(Map<String, dynamic> json) =>
      _$EmailCheckDataModelFromJson(json);

  EmailCheckDataEntity toEntity() {
    return EmailCheckDataEntity(
      isDuplicated: isDuplicated,
      isWithdrawnRecently: isWithdrawnRecently,
    );
  }
}
```

### Model 파일 작성 원칙
1. **하나의 API 응답 = 하나의 Model 파일**
2. **파일명은 응답 타입을 명확히 표현** (email_check_model.dart, login_model.dart)
3. **전체 응답 구조(code, message, data)와 data 내부 구조는 같은 파일에 작성**
4. **중첩된 Model도 모두 `toEntity()` 제공**

---

## Service 래핑 패턴

### Service를 만들어야 하는 경우
1. **플랫폼 정보 접근**: device_info_plus, package_info_plus, network_info_plus
2. **하드웨어/센서 접근**: geolocator, camera, image_picker
3. **외부 서비스 연동**: Firebase 관련 패키지, 소셜 로그인 SDK

### Service 생성 패턴
```dart
// 1. Abstract 클래스로 인터페이스 정의
abstract class NetworkInfoService {
  Future<String?> getWifiIPv4();
  Future<String?> getWifiIPv6();
}

// 2. 구현 클래스 생성 (테스트를 위해 생성자에서 의존성 주입)
class NetworkInfoServiceImpl implements NetworkInfoService {
  final NetworkInfo _networkInfo;

  NetworkInfoServiceImpl({NetworkInfo? networkInfo})
      : _networkInfo = networkInfo ?? NetworkInfo();

  @override
  Future<String?> getWifiIPv4() async {
    try {
      return await _networkInfo.getWifiIP();
    } catch (e) {
      logger.e('Failed to get IPv4 address: $e');
      return null;
    }
  }

  @override
  Future<String?> getWifiIPv6() async {
    try {
      return await _networkInfo.getWifiIPv6();
    } catch (e) {
      logger.e('Failed to get IPv6 address: $e');
      return null;
    }
  }
}
```

### Service 파일 위치
- 경로: `lib/core/services/`
- 명명 규칙: `{기능명}_service.dart`
- 예시: `device_info_service.dart`, `network_info_service.dart`

### Provider 설정
```dart
// lib/core/providers/{기능명}_providers.dart
@riverpod
NetworkInfoService networkInfoService(Ref ref) {
  return NetworkInfoServiceImpl();
}
```

### Service를 만들지 않아도 되는 경우
1. **상태 관리**: flutter_riverpod
2. **유틸리티**: fpdart, logger, equatable
3. **UI**: flutter 위젯들
4. **저장소**: shared_preferences, flutter_secure_storage (DataSource 레이어에서 사용)
5. **코드 생성**: freezed, json_serializable

### 예외: AuthInterceptor의 Storage 직접 접근
```dart
// AuthInterceptor에서는 FlutterSecureStorage 직접 사용 가능
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  AuthInterceptor({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final accessToken = await _secureStorage.read(key: AppConstants.accessTokenKey);
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    } catch (e) {
      // 토큰 읽기 실패 시 로그만 남기고 계속 진행
      logger.w('AuthInterceptor: Failed to read access token: $e');
    }
    return handler.next(options);
  }
}
```

**이유:**
1. 같은 Infrastructure Layer
2. 횡단 관심사 (모든 HTTP 요청에 자동 적용)
3. 에러 처리 철학 차이 (에러 시 조용히 무시, 토큰 없어도 요청 진행)
4. 실용성 (DataSource를 거치면 불필요하게 복잡해짐)

**주의:** 이 예외는 **AuthInterceptor에만** 적용

---

## 데이터 수집 패턴

### 원칙: ViewModel에서 데이터 수집 후 전달

**❌ 잘못된 패턴: Repository에서 직접 수집**
```dart
class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfoService networkInfoService;  // ❌ 의존성 추가

  @override
  Future<Either<Failure, void>> logout() async {
    final ipv4 = await networkInfoService.getWifiIPv4();  // ❌ 직접 수집
    await remoteDataSource.logout(ipv4: ipv4);
  }
}
```

**문제점:**
- Repository의 책임이 과중 (데이터 수집 + 저장/조회)
- 테스트 시 Service도 mock 필요
- 재사용성 저하

**✅ 올바른 패턴**

1. Entity 생성
```dart
@freezed
abstract class NetworkInfoEntity with _$NetworkInfoEntity {
  const factory NetworkInfoEntity({String? ipv4, String? ipv6}) = _NetworkInfoEntity;
}
```

2. Provider 생성 (Service 래핑)
```dart
@riverpod
NetworkInfoService networkInfoService(Ref ref) {
  return NetworkInfoServiceImpl();
}

@riverpod
Future<NetworkInfoEntity> networkInfo(Ref ref) async {
  final service = ref.read(networkInfoServiceProvider);
  return NetworkInfoEntity(
    ipv4: await service.getWifiIPv4(),
    ipv6: await service.getWifiIPv6(),
  );
}
```

3. Repository는 파라미터로 받음
```dart
abstract class AuthRepository {
  Future<Either<Failure, void>> logout({required NetworkInfoEntity networkInfo});
}

class AuthRepositoryImpl extends AuthRepository {
  // ✅ Service 의존성 없음
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, void>> logout({required NetworkInfoEntity networkInfo}) async {
    final refreshToken = await localDataSource.getRefreshToken();
    await remoteDataSource.logout(
      refreshToken: refreshToken!,
      ipv4: networkInfo.ipv4,
      ipv6: networkInfo.ipv6,
    );
    await localDataSource.deleteTokens();
    return const Right(null);
  }
}
```

4. UseCase도 파라미터로 받음
```dart
class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Either<Failure, void>> call({required NetworkInfoEntity networkInfo}) async {
    return await _authRepository.logout(networkInfo: networkInfo);
  }
}
```

5. ViewModel에서 데이터 수집 후 호출
```dart
Future<void> logout() async {
  state = state.copyWith(status: .loading);

  try {
    // ✅ ViewModel에서 데이터 수집
    final networkInfo = await ref.read(networkInfoProvider.future);

    final logoutUseCase = ref.read(logoutUseCaseProvider);
    final result = await logoutUseCase(networkInfo: networkInfo);

    result.fold(
      (failure) => state = state.copyWith(status: .error, errorMessage: failure.message),
      (_) => state = state.copyWith(status: .success),
    );
  } catch (e) {
    logger.e('Logout error: $e');
  }
}
```

**장점:**
- 단일 책임 원칙: Repository는 저장/조회만 담당
- 재사용성: 다른 ViewModel에서도 같은 Provider 사용 가능
- 테스트 용이: ViewModel 테스트 시 Provider만 mock
- 일관성: 모든 데이터 수집이 ViewModel 레이어에서 발생

---

## Riverpod Provider 참조 패턴

### 한 번만 사용하는 경우 - 직접 사용
```dart
onPressed: () {
  ref.read(counterProvider.notifier).increment();
}

onTap: () => ref.read(authProvider.notifier).login()
```

### 여러 번 사용하는 경우 - 변수로 추출
```dart
void _handleSubmit() {
  final viewModel = ref.read(formViewModelProvider.notifier);
  viewModel.validate();
  viewModel.submit();
  viewModel.clearForm();
}

void _handleLogin() {
  final authViewModel = ref.read(authViewModelProvider.notifier);
  final analyticsViewModel = ref.read(analyticsViewModelProvider.notifier);
  authViewModel.login(email, password);
  analyticsViewModel.trackEvent('login_attempt');
}
```

### 콜백으로 전달하는 경우 - 메서드 참조 사용
```dart
void _showDialog() {
  final viewModel = ref.read(homeViewModelProvider.notifier);

  DialogHelper.showChoice(
    context,
    title: '확인',
    message: '실행하시겠습니까?',
    onConfirm: viewModel.execute,  // ✅ 메서드 참조 (파라미터 없을 때)
  );
}

// ✅ 파라미터가 있으면 익명 함수 필요
onConfirm: () {
  viewModel.execute(param1, param2);
}
```

---

## Flavor 환경 분리 패턴

### 환경별 진입점
```
lib/entry/
├── dev.entry.dart   # 개발 환경
├── stg.entry.dart   # 스테이징 환경
└── prod.entry.dart  # 프로덕션 환경
```

### Entry 파일 구조
```dart
// lib/entry/dev.entry.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../main.dart' as entry;

Future<void> main() async {
  await dotenv.load(fileName: 'assets/env/.env.dev');
  final name = dotenv.env['FLAVOR'];
  entry.main(name);
}
```

### 환경 변수 파일
```
assets/env/
├── .env.dev
├── .env.stg
└── .env.prod
```

```env
# assets/env/.env.dev
FLAVOR=dev
API_BASE_URL=https://dev.api.example.com:8437
ENABLE_LOGGING=true
SHOW_DEBUG_INFO=true
```

### API Constants에서 환경 변수 사용
```dart
// lib/core/constants/api_constants.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String flavor = dotenv.env['FLAVOR'] ?? 'prod';
  static final String baseUrl = _getBaseUrl();

  static String _getBaseUrl() {
    switch (flavor) {
      case 'dev': return baseUrlDev;
      case 'stg': return baseUrlStg;
      case 'prod':
      default: return baseUrlProd;
    }
  }

  static const String baseUrlDev = 'https://dev.api.example.com:8437';
  static const String baseUrlStg = 'https://stg.api.example.com:8437';
  static const String baseUrlProd = 'https://api.example.com:8437';

  // API Endpoints
  static const String loginEndpoint = '/api/v1/auth/signin';
  static const String logoutEndpoint = '/api/v1/auth/logout';
}
```

### Flavor 실행 방법
```bash
flutter run -t lib/entry/dev.entry.dart   # 개발
flutter run -t lib/entry/stg.entry.dart   # 스테이징
flutter run -t lib/entry/prod.entry.dart  # 프로덕션
```

### 환경별 설정 관리
```dart
final enableLogging = dotenv.env['ENABLE_LOGGING'] == 'true';
final showDebugInfo = dotenv.env['SHOW_DEBUG_INFO'] == 'true';
```

---

## Clean Architecture 레이어별 역할

### Data Layer
- **DataSource**: API 호출, 로컬 저장소 접근
- **Model**: JSON 직렬화/역직렬화
- **RepositoryImpl**: Repository 인터페이스 구현, 예외 처리
  - ⚠️ Repository는 데이터 저장/조회만 담당, 외부 데이터 수집 안 함

### Domain Layer
- **Entity**: 불변 비즈니스 객체
- **Repository**: 추상 인터페이스
- **UseCase**: 비즈니스 로직, 유효성 검증

### Presentation Layer
- **ViewModel**: 상태 관리, UseCase 호출
  - ✅ ViewModel에서 필요한 데이터를 수집하여 UseCase에 전달
- **View**: UI 렌더링

### 레이어별 책임
| 레이어 | 책임 | 의존성 방향 |
|--------|------|------------|
| **View** | UI 렌더링, 사용자 이벤트 처리 | → ViewModel |
| **ViewModel** | 상태 관리, 비즈니스 로직 호출 | → UseCase, Provider |
| **UseCase** | 비즈니스 로직, 유효성 검증 | → Repository |
| **Repository** | 데이터 소스 조율, 에러 변환 | → DataSource |
| **DataSource** | API 호출, 로컬 저장소 접근 | → Dio, Storage |
| **Model** | JSON 직렬화/역직렬화 | → Entity |
| **Entity** | 불변 비즈니스 객체 | - |

---

## 데이터 흐름 아키텍처

### 전체 흐름: API 호출 예시 (로그인)
```
┌─────────────────────────────────────────────────────────────┐
│ 1. View (Presentation Layer)                                │
│    - 사용자가 버튼 클릭                                      │
│    - ref.read(loginViewModelProvider.notifier).login()      │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 2. ViewModel (Presentation Layer)                           │
│    - 디바이스 정보 수집: ref.read(userDeviceInfoProvider)   │
│    - UseCase 호출: loginUseCase(email, password, deviceInfo)│
│    - 상태 업데이트: state = state.copyWith(...)             │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 3. UseCase (Domain Layer)                                   │
│    - 유효성 검증: Validators.validateEmail(email)           │
│    - Repository 호출: authRepository.login(...)             │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 4. Repository (Data Layer)                                  │
│    - RemoteDataSource 호출                                  │
│    - LocalDataSource 저장                                   │
│    - Exception → Failure 변환                               │
│    - Either<Failure, Entity> 반환                           │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 5. DataSource (Data Layer)                                  │
│    - Dio POST 요청                                          │
│    - HTTP 상태 코드 확인 (200, 201)                         │
│    - 비즈니스 코드 확인 (SUCCESS)                            │
│    - JSON → Model 변환                                      │
│    - Model → Entity 변환 (toEntity())                       │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 6. ViewModel (결과 처리)                                    │
│    - result.fold(                                           │
│        (failure) => state = error,                          │
│        (auth) => state = success,                           │
│      )                                                      │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│ 7. View (상태 변화 감지)                                    │
│    - ref.listen: 성공 시 화면 이동 (context.go)             │
│    - ref.watch: 로딩 UI 표시 (CircularProgressIndicator)    │
└─────────────────────────────────────────────────────────────┘
```

### MVVM + Clean Architecture 통합
```
┌─────────────────────────────────────────────────────────────┐
│                        Presentation Layer                    │
│  ┌────────────┐         ┌────────────┐                      │
│  │   View     │ ◄─────► │  ViewModel │                      │
│  │ (UI Layer) │         │ (State +   │                      │
│  │            │         │  Logic)    │                      │
│  └────────────┘         └────────────┘                      │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│                         Domain Layer                         │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐        │
│  │  UseCase   │ ─► │ Repository │ ◄─ │   Entity   │        │
│  │ (Business  │    │(Interface) │    │ (Business  │        │
│  │   Logic)   │    │            │    │   Object)  │        │
│  └────────────┘    └────────────┘    └────────────┘        │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│                          Data Layer                          │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐        │
│  │Repository  │ ─► │ DataSource │ ◄─ │   Model    │        │
│  │   Impl     │    │ (API/Local)│    │   (JSON)   │        │
│  └────────────┘    └────────────┘    └────────────┘        │
└─────────────────────────────────────────────────────────────┘
```

---

## 인증 처리 아키텍처

### 계층 구조
```
┌─────────────────────────────────────────────────────────────┐
│ Presentation Layer                                           │
│   - AuthErrorHandlerMixin (401/403 처리, Token Refresh)     │
├─────────────────────────────────────────────────────────────┤
│ Domain Layer                                                 │
│   - RefreshTokenUseCase (비즈니스 로직)                      │
├─────────────────────────────────────────────────────────────┤
│ Data Layer                                                   │
│   - AuthRepository (Token 저장/조회)                         │
├─────────────────────────────────────────────────────────────┤
│ Infrastructure Layer                                         │
│   - AuthInterceptor (토큰 주입만, 비즈니스 로직 없음)        │
└─────────────────────────────────────────────────────────────┘
```

### Interceptor에서 Refresh를 처리하지 않는 이유
1. **단일 책임 원칙**: Interceptor는 토큰 주입만 담당
2. **의존성 역전**: Infrastructure Layer는 Domain Layer에 의존할 수 없음
3. **테스트 용이성**: Mixin은 ViewModel 테스트 시 쉽게 mock 가능
4. **비즈니스 로직 분리**: Token Refresh는 비즈니스 로직이므로 UseCase로 처리

### AuthErrorHandlerMixin 처리 흐름

**401 (Access Token 만료):**
```
API 호출 → 401 → handleAuthError() → Refresh Token 갱신 → 재시도 → 성공
→ 사용자는 아무것도 모름 (투명한 처리)
```

**403 (Refresh Token 만료):**
```
API 호출 → 403 → handleAuthError() → 토큰 삭제 → '세션 만료' 메시지 → 로그인 화면
→ 사용자에게 로그인 화면 표시
```

### retry 함수 주의사항
```dart
// ❌ 잘못된 예 - 파라미터 누락
final handled = await handleAuthError(
  ref: ref,
  result: result,
  retry: () => getDevicesUseCase(),  // memberId 누락!
);

// ✅ 올바른 예 - 원래 요청과 동일한 파라미터
final currentUser = ref.read(currentUserProvider);
final handled = await handleAuthError(
  ref: ref,
  result: result,
  retry: () => getDevicesUseCase(memberId: currentUser.memberId),
);
```

### 세션 만료 감지 패턴
```dart
// ✅ Good - 유연한 감지 (메시지 변경에 강함)
final isSessionExpired =
  next.errorMessage?.contains('세션이 만료') == true ||
  next.errorMessage?.contains('다시 로그인') == true;

// ❌ Bad - 하드코딩 (메시지 변경 시 동작 안 함)
if (next.errorMessage == '세션이 만료되었습니다. 다시 로그인해주세요.') { }
```

---

## 새 기능 추가 전체 가이드

### 1. Entity 정의 (Domain)
```dart
// lib/domain/entities/user/user_entity.dart
@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String email,
    required String name,
  }) = _UserEntity;
}
```

### 2. Model 정의 (Data)
```dart
// lib/data/models/user/user_model.dart
@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    required String email,
    required String name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserEntity toEntity() => UserEntity(id: id, email: email, name: name);
}
```

### 3. Repository 인터페이스 (Domain)
```dart
// lib/domain/repositories/user/user_repository.dart
abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser(int id);
}
```

### 4. DataSource (Data)
```dart
// lib/data/data_sources/remote/user/user_remote_datasource.dart
abstract class UserRemoteDataSource {
  Future<UserModel> getUser(int id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUser(int id) async {
    final response = await dio.get('/api/v1/users/$id');
    return UserModel.fromJson(response.data);
  }
}
```

### 5. Repository 구현 (Data)
```dart
// lib/data/repositories_impl/user/user_repository_impl.dart
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser(int id) async {
    try {
      final user = await remoteDataSource.getUser(id);
      return Right(user.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
```

### 6. UseCase (Domain)
```dart
// lib/domain/usecases/user/get_user_usecase.dart
class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(int id) async {
    return await repository.getUser(id);
  }
}
```

### 7. DI Provider (DI)
```dart
// lib/di/user/user_providers.dart
@riverpod
UserRemoteDataSource userRemoteDataSource(Ref ref) {
  return UserRemoteDataSourceImpl(dio: ref.read(dioProvider));
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(remoteDataSource: ref.read(userRemoteDataSourceProvider));
}

@riverpod
GetUserUseCase getUserUseCase(Ref ref) {
  return GetUserUseCase(ref.read(userRepositoryProvider));
}
```

### 8. State (Presentation)
```dart
// lib/presentation/viewmodels/user/user_state.dart
enum UserStatus { initial, loading, success, error }

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    required UserStatus status,
    UserEntity? user,
    String? errorMessage,
  }) = _UserState;

  factory UserState.initial() => const UserState(status: .initial);
}
```

### 9. ViewModel (Presentation)
```dart
// lib/presentation/viewmodels/user/user_viewmodel.dart
@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  UserState build() => UserState.initial();

  Future<void> loadUser(int id) async {
    state = state.copyWith(status: .loading);

    final getUserUseCase = ref.read(getUserUseCaseProvider);
    final result = await getUserUseCase(id);

    result.fold(
      (failure) => state = state.copyWith(status: .error, errorMessage: failure.message),
      (user) => state = state.copyWith(status: .success, user: user),
    );
  }
}
```

### 10. View (Presentation)
```dart
// lib/presentation/views/user/user_view.dart
class UserView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userViewModelProvider);

    ref.listen(userViewModelProvider, (previous, next) {
      if (next.status == .error) {
        SnackbarHelper.showError(context, next.errorMessage!);
      }
    });

    return Scaffold(
      body: state.status == .loading
        ? const CircularProgressIndicator()
        : Text(state.user?.name ?? ''),
    );
  }
}
```

### 11. Export 추가
```dart
// lib/domain/domain.dart
export 'entities/user/user_entity.dart';
export 'repositories/user/user_repository.dart';
export 'usecases/user/get_user_usecase.dart';

// lib/di/di.dart
export 'user/user_providers.dart';
```

### 12. Build Runner 실행
```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

---

## 프로젝트 시작 가이드

### 디렉토리 구조 생성
```bash
mkdir -p lib/{core,data,domain,presentation,di,entry}
mkdir -p lib/core/{constants,errors,network,providers,router,services,theme,utils,mixins}
mkdir -p lib/data/{data_sources,models,repositories_impl}
mkdir -p lib/data/data_sources/{local,remote}
mkdir -p lib/domain/{entities,repositories,usecases}
mkdir -p lib/presentation/{mixins,providers,router,viewmodels,views,widgets}
mkdir -p assets/env
```

### 필수 패키지 (pubspec.yaml)
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  dio: ^5.7.0
  fpdart: ^2.0.0
  flutter_secure_storage: ^9.2.2
  shared_preferences: ^2.3.3
  go_router: ^14.6.2
  flutter_dotenv: ^5.2.1
  logger: ^2.5.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.13
  riverpod_generator: ^2.6.2
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  flutter_lints: ^5.0.0
```

### 핵심 원칙 요약

**Clean Architecture:**
- Data, Domain, Presentation 레이어 분리
- 의존성은 항상 안쪽(Domain)으로만 향함
- Repository는 인터페이스(Domain)와 구현(Data) 분리

**MVVM 패턴:**
- View: UI 렌더링만
- ViewModel: 상태 관리 + UseCase 호출
- State: Freezed 불변 객체

**DI (Dependency Injection):**
- Riverpod Provider로 의존성 관리
- 기능별로 Provider 파일 분리
- Override로 초기화 필요한 Provider 처리

**에러 처리:**
- Exception (DataSource) → Failure (Repository) → UI 메시지 (ViewModel)
- Either 패턴으로 함수형 에러 처리

**코드 생성:**
- Freezed: Entity, Model, State
- Riverpod Generator: Provider, ViewModel
- Build Runner 자동 실행 필수
