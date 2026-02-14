# UI 컴포넌트 가이드

## 색상 (AppTheme)

### 기본 색상

```dart
AppTheme.primaryColor       // Color(0xFF1b245d)
AppTheme.secondaryColor     // Color(0xFFffe202)
AppTheme.errorColor         // 에러
AppTheme.successColor       // 성공
AppTheme.warningColor       // 경고
```

### 회색 계열

```dart
AppTheme.grey_900
AppTheme.grey_500
AppTheme.grey_200
```

### 테마별 색상

```dart
// Light Mode
AppTheme.lightBackground
AppTheme.lightSurface
AppTheme.lightTextPrimary

// Dark Mode
AppTheme.darkBackground
AppTheme.darkSurface
AppTheme.darkTextPrimary
```

### 사용 규칙

```dart
// ✅ Good
color: AppTheme.primaryColor
color: AppTheme.grey_500

// ❌ Bad
color: Color(0xFF1b245d)
color: Colors.grey
```

---

## 텍스트 스타일 (AppTheme)

| 스타일           | 크기 | 굵기   | 용도             |
| ---------------- | ---- | ------ | ---------------- |
| `headlineLarge`  | 32px | bold   | 큰 제목          |
| `headlineMedium` | 28px | bold   | 중간 제목        |
| `titleLarge`     | 22px | w600   | 섹션 제목        |
| `titleMedium`    | 16px | w600   | 카드/아이템 제목 |
| `titleSmall`     | 14px | w600   | 작은 제목        |
| `bodyLarge`      | 16px | normal | 큰 본문          |
| `bodyMedium`     | 14px | normal | 일반 본문        |
| `bodySmall`      | 12px | normal | 작은 본문/캡션   |

### 사용 규칙

```dart
// ✅ Good
Text('제목', style: AppTheme.headlineLarge)
Text('본문', style: AppTheme.bodyMedium)

// ❌ Bad
Text('제목', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))
```

---

## Spacing (AppSpace / AppConstants)

### AppSpace (SizedBox 위젯)

| 높이            | 너비            | 값   |
| --------------- | --------------- | ---- |
| `AppSpace.hXs`  | `AppSpace.wXs`  | 4.0  |
| `AppSpace.hSm`  | `AppSpace.wSm`  | 8.0  |
| `AppSpace.hMd`  | `AppSpace.wMd`  | 16.0 |
| `AppSpace.hLg`  | `AppSpace.wLg`  | 24.0 |
| `AppSpace.hXl`  | `AppSpace.wXl`  | 32.0 |
| `AppSpace.hXxl` | `AppSpace.wXxl` | 64.0 |

### AppConstants (값)

| 상수        | 값   |
| ----------- | ---- |
| `spacingXs` | 4.0  |
| `spacingSm` | 8.0  |
| `spacingMd` | 16.0 |
| `spacingLg` | 24.0 |
| `spacingXl` | 32.0 |

### 사용 규칙

```dart
// ✅ Good - SizedBox
AppSpace.hMd  // SizedBox(height: 16)
AppSpace.wLg  // SizedBox(width: 24)

// ✅ Good - Padding
Padding(padding: EdgeInsets.all(AppConstants.spacingMd))
EdgeInsets.symmetric(horizontal: AppConstants.spacingLg)

// ❌ Bad
const SizedBox(height: 20)
Padding(padding: EdgeInsets.all(16.0))
```

---

## Border Radius (AppConstants)

| 상수       | 값   | 용도           |
| ---------- | ---- | -------------- |
| `radiusSm` | 4.0  | 작은 모서리    |
| `radiusMd` | 8.0  | 일반 모서리    |
| `radiusLg` | 12.0 | 큰 모서리      |
| `radiusXl` | 16.0 | 매우 큰 모서리 |

### 사용 규칙

```dart
// ✅ Good
BorderRadius.circular(AppConstants.radiusMd)
BorderRadius.circular(AppConstants.radiusLg)

// ❌ Bad
BorderRadius.circular(8.0)
BorderRadius.circular(12.0)
```

---

## Icon Sizes & Button Heights (AppConstants)

| 상수                | 값   |
| ------------------- | ---- |
| `iconSizeMedium`    | 50.0 |
| `iconSizeLarge`     | 80.0 |
| `buttonHeightLarge` | 56.0 |

### 사용 규칙

```dart
// ✅ Good
Icon(Icons.check_circle, size: AppConstants.iconSizeMedium)
Container(width: AppConstants.iconSizeLarge, height: AppConstants.iconSizeLarge)
CustomButton(height: AppConstants.buttonHeightLarge)

// ❌ Bad
Icon(Icons.check_circle, size: 50)
Container(width: 80, height: 80)
CustomButton(height: 56)
```

---

## Snackbar (SnackbarHelper)

### 종류

```dart
SnackbarHelper.showSuccess(context, '성공했습니다');
SnackbarHelper.showError(context, '오류가 발생했습니다');
SnackbarHelper.showInfo(context, '안내 메시지');
SnackbarHelper.showWarning(context, '경고 메시지');
```

### 특징

- 자동으로 기존 스낵바 제거 (중복 방지)
- 일관된 디자인 (아이콘, 색상, 모양)
- Duration 커스터마이징 가능

### 사용 규칙

```dart
// ✅ Good
SnackbarHelper.showError(context, '오류가 발생했습니다');

// ❌ Bad
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('메시지')),
);
```

---

## Dialog (DialogHelper)

### 1. 확인 다이얼로그 (1개 버튼)

```dart
DialogHelper.showConfirm(
  context,
  title: '알림',
  message: '저장되었습니다',
  confirmText: '확인',
  onConfirm: () {
    // 확인 버튼 클릭 시 동작
  },
);
```

### 2. 선택 다이얼로그 (2개 버튼)

```dart
DialogHelper.showChoice(
  context,
  title: '로그아웃',
  message: '로그아웃 하시겠습니까?',
  cancelText: '취소',
  confirmText: '확인',
  onConfirm: () {
    // 확인 버튼 클릭 시 동작
  },
);
```

### 3. 에러 다이얼로그

```dart
DialogHelper.showError(
  context,
  title: '오류',
  message: '오류가 발생했습니다',
);
```

### 4. 성공 다이얼로그

```dart
DialogHelper.showSuccess(
  context,
  title: '성공',
  message: '작업이 완료되었습니다',
);
```

### 5. 경고 다이얼로그

```dart
DialogHelper.showWarning(
  context,
  title: '경고',
  message: '주의가 필요합니다',
);
```

### 특징

- 모던하고 일관된 디자인
- 자동 중앙 정렬 및 반응형 크기
- Primary/Secondary 버튼 스타일 자동 적용
- barrierDismissible: false (실수로 닫히지 않음)

### 사용 가이드

| 상황             | 메서드                               |
| ---------------- | ------------------------------------ |
| 단순 알림        | `showConfirm()` 또는 `showSuccess()` |
| 사용자 선택 필요 | `showChoice()`                       |
| 에러 발생        | `showError()`                        |
| 경고 메시지      | `showWarning()`                      |

### 사용 규칙

```dart
// ❌ Bad - 직접 구현
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('제목'),
    content: Text('메시지'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('확인'),
      ),
    ],
  ),
);
```

---

## 라우팅 (RoutePath)

### 사용 규칙

```dart
// ✅ Good
context.go(RoutePath.login);
context.go(RoutePath.home);

// ❌ Bad
context.go('/login');
context.go('/home');
```

### 새 경로 추가 시

1. `lib/core/router/route_path.dart`에 상수 추가
2. `lib/core/router/app_router.dart`에 라우트 정의

---

## 반응형 UI (ResponsiveUtils)

### Breakpoints

| 타입    | 범위          |
| ------- | ------------- |
| Mobile  | < 600px       |
| Tablet  | 600px ~ 900px |
| Desktop | > 900px       |

### 사용법

```dart
// 디바이스 타입 확인
if (ResponsiveUtils.isMobile(context)) {
  // 모바일 레이아웃
}

// 반응형 값
final padding = ResponsiveUtils.responsiveValue(
  context,
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
);

// 반응형 위젯
ResponsiveLayout(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
)
```

---

## 코드 스타일 규칙

### Color Opacity

```dart
// ✅ Good - withValues 사용
color: AppTheme.successColor.withValues(alpha: 0.1)
color: Colors.red.withValues(alpha: 0.5)

// ❌ Bad - withOpacity 금지 (deprecated)
color: AppTheme.successColor.withOpacity(0.1)
color: Colors.red.withOpacity(0.5)
```

### const 사용

**반드시 사용:**

```dart
const SizedBox(height: 20)
const Padding(padding: EdgeInsets.all(16))
const Icon(Icons.home)
const Text('고정 텍스트')
const EdgeInsets.all(16)
const MyWidget({super.key});
```

**사용 불가:**

```dart
Text(userName)  // 동적 값
SizedBox(height: dynamicHeight)  // 동적 값
ref.watch(someProvider)  // 상태 관찰
```

**성능 최적화:**

- `const`를 사용하면 Flutter가 위젯을 재사용하여 리빌드 시 성능 향상
- 가능한 모든 곳에 `const` 추가 권장
- IDE 린트 경고(`Prefer const constructors`)를 따르세요

### Enum Shorthand (Dart 3.6+)

**타입이 명확한 컨텍스트에서 사용:**

```dart
// ✅ Good
Text('Hello', textAlign: .center)
state = state.copyWith(status: .loading)

switch (status) {
  case .initial: return const SizedBox();
  case .loading: return const CircularProgressIndicator();
}

if (state.status == .loading) { ... }

// 함수 파라미터에서
EdgeInsets.symmetric(horizontal: 16, vertical: 8)
BorderRadius.circular(AppConstants.radiusMd)
```

**타입 추론 불가 시:**

```dart
// ❌ Bad - 컴파일 에러
final alignment = .center;
var textAlign = .center;

// ✅ Good
final TextAlign alignment = .center;
final alignment = TextAlign.center;
TextAlign textAlign = .center;
```

**함수 반환값에서:**

```dart
// ✅ Good - 반환 타입이 명시된 경우
TextAlign getAlignment() {
  return .center;
}

// ✅ Good - 조건부 표현식에서
TextAlign getAlignment(bool isRtl) => isRtl ? .right : .left;
```

### children 배열 가독성

**위젯 사이에 빈 줄 추가:**

```dart
// ✅ Good
Column(
  children: [
    Text('첫 번째 위젯'),

    Container(
      child: Text('두 번째 위젯'),
    ),

    Row(
      children: [
        Icon(Icons.home),

        Text('아이콘 옆 텍스트'),
      ],
    ),
  ],
)

// ✅ Good - TextSpan 예시
Text.rich(
  TextSpan(
    children: [
      TextSpan(
        text: '이용약관',
        style: AppTheme.bodyMedium.copyWith(
          color: AppTheme.primaryColor,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl('https://example.com/terms');
          },
      ),

      const TextSpan(text: ' 및 '),

      TextSpan(
        text: '개인정보취급방침',
        style: AppTheme.bodyMedium.copyWith(
          color: AppTheme.primaryColor,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _launchUrl('https://example.com/privacy');
          },
      ),

      const TextSpan(text: '에\n동의합니다.'),
    ],
  ),
)

// ❌ Bad - 가독성 저하
Column(
  children: [
    Text('첫 번째 위젯'),
    Container(child: Text('두 번째 위젯')),
    Row(children: [Icon(Icons.home), Text('아이콘 옆 텍스트')]),
  ],
)
```

**규칙:**

1. Column, Row, Stack 등의 children 배열에서 각 위젯 사이에 빈 줄 추가
2. TextSpan의 children 배열에서도 동일하게 적용
3. 매우 간단한 위젯(const Text, const SizedBox)은 예외 가능
4. 들여쓰기는 자동 포맷팅을 따름 (Dart Formatter)

### 후행 쉼표 (Trailing comma)

```dart
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Hello'),  // 후행 쉼표
    ],  // 후행 쉼표
  );
}
```

### "Section" 네이밍 금지

```dart
// ❌ Bad
class LoginInputSection extends ConsumerWidget { }
class LoginButtonSection extends ConsumerWidget { }
class LoginLinksSection extends StatelessWidget { }

// ✅ Good - 구체적인 이름 사용
class LoginInputFields extends ConsumerWidget { }
class LoginButton extends ConsumerWidget { }
class LoginLinks extends StatelessWidget { }
```

**규칙:**

- Widget 클래스명에 "Section"을 사용하지 마세요
- 대신 위젯의 실제 역할을 나타내는 구체적인 이름 사용
- 예외: 레이아웃 목적의 일반적인 섹션 컴포넌트는 허용 가능

---

## Flavor Banner Mixin

### 개발 환경에서 Flavor 표시

```dart
// lib/core/mixins/flavor_banner_mixin.dart
mixin FlavorBannerMixin on StatelessWidget {
  Widget buildWithBanner(BuildContext context, Widget child) {
    final flavor = dotenv.env['FLAVOR'];

    if (flavor == 'prod') {
      return child;  // 프로덕션에서는 배너 없음
    }

    return Banner(
      message: flavor?.toUpperCase() ?? 'UNKNOWN',
      location: BannerLocation.topEnd,
      child: child,
    );
  }
}
```
