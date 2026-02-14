# Flutter Clean Architecture Static Validator

정적 검증 시스템으로 AI 토큰을 소비하지 않고 Clean Architecture 규칙을 자동으로 검증합니다.

## 특징

- **비용**: $0 (토큰 소비 없음)
- **속도**: 즉시 (밀리초 단위)
- **자동 실행**: Edit/Write 도구 사용 시 자동 검증
- **10가지 규칙 검증**

## 검증 규칙

### 1. Freezed 3.0 - abstract class 필수 ✅❌
```dart
// ❌ 잘못됨
@freezed
class UserEntity with _$UserEntity { }

// ✅ 올바름
@freezed
abstract class UserEntity with _$UserEntity { }
```

### 2. Either 패턴 - Repository 반환 타입 ✅❌
```dart
// ❌ 잘못됨 (Repository 인터페이스)
Future<UserEntity> getUser(String id);

// ✅ 올바름
Future<Either<Failure, UserEntity>> getUser(String id);
```

### 3. Export 순서 - 알파벳 정렬 ⚠️
```dart
// ⚠️ 경고
export 'package:app/domain/entities/user/user_entity.dart';
export 'package:app/domain/entities/auth/auth_entity.dart';  // 순서 잘못됨

// ✅ 올바름 (알파벳순)
export 'package:app/domain/entities/auth/auth_entity.dart';
export 'package:app/domain/entities/user/user_entity.dart';
```

### 4. JsonSerializable - Model에만 사용 ✅❌
```dart
// ❌ Entity에 사용 금지
// user_entity.dart
@JsonSerializable()
abstract class UserEntity { }

// ✅ Model에만 사용
// user_model.dart
@JsonSerializable()
abstract class UserModel { }
```

### 5. Model toEntity() 메서드 필수 ⚠️
```dart
// ⚠️ 경고
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({required String id}) = _UserModel;
  // toEntity() 없음
}

// ✅ 올바름
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({required String id}) = _UserModel;

  UserEntity toEntity() => UserEntity(id: id);
}
```

### 6. Entity는 JsonSerializable 금지 ✅❌
```dart
// ❌ Entity에 JsonSerializable 사용 금지
@JsonSerializable()
abstract class UserEntity { }

// ✅ Entity는 순수한 비즈니스 객체
abstract class UserEntity { }
```

### 7. Riverpod ref.watch는 build()에만 ⚠️
```dart
// ⚠️ 경고 (이벤트 핸들러에서 ref.watch 사용)
void onPressed() {
  final user = ref.watch(userProvider);  // 잘못됨
}

// ✅ 올바름
Widget build(BuildContext context, WidgetRef ref) {
  final user = ref.watch(userProvider);  // build()에서만

  return ElevatedButton(
    onPressed: () {
      ref.read(userProvider.notifier).updateUser();  // 이벤트에서는 ref.read
    },
  );
}
```

### 8. 하드코딩된 색상/크기 금지 ⚠️
```dart
// ⚠️ 경고
Container(
  color: Color(0xFF000000),
  child: Text('Hello', style: TextStyle(fontSize: 16))
)

// ✅ 올바름
Container(
  color: AppTheme.colors.primary,
  child: Text('Hello', style: AppTheme.textStyles.body)
)
```

### 9. withOpacity 대신 withValues 사용 ⚠️
```dart
// ⚠️ 경고
color.withOpacity(0.5)

// ✅ 올바름
color.withValues(alpha: 0.5)
```

### 10. RoutePath 사용 (하드코딩 경로 금지) ⚠️
```dart
// ⚠️ 경고
context.go('/login');

// ✅ 올바름
context.go(RoutePath.login);
```

## 사용 방법

### 자동 검증 (기본)
파일을 Edit/Write하면 자동으로 검증됩니다:

```
Claude: user_entity.dart를 수정하겠습니다
→ Edit/Write 실행
→ 자동 검증기 실행
→ ✅ 통과 또는 ❌ 에러 표시
```

### 수동 검증
특정 파일을 직접 검증하려면:

```bash
./.claude/hooks/validator.sh lib/domain/entities/user/user_entity.dart
```

### 여러 파일 일괄 검증
```bash
# 모든 Entity 파일 검증
find lib/domain/entities -name "*.dart" -exec ./.claude/hooks/validator.sh {} \;

# 모든 Model 파일 검증
find lib/data/models -name "*.dart" -exec ./.claude/hooks/validator.sh {} \;

# 전체 프로젝트 검증
find lib -name "*.dart" -exec ./.claude/hooks/validator.sh {} \;
```

## 결과 해석

### ✅ 성공
```
🔍 Validating: user_entity.dart
✅ Freezed abstract class
✅ Entity without JsonSerializable

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✨ All validation checks passed!
```

### ❌ 에러 (파일 수정 차단)
```
🔍 Validating: user_entity.dart
❌ ERROR: Freezed 3.0 requires 'abstract class'
   Fix: Change 'class' to 'abstract class'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
❌ 1 error(s), 0 warning(s) found

Validation failed. Please fix the errors above.
```

### ⚠️ 경고 (수정 허용, 권장사항)
```
🔍 Validating: user_view.dart
⚠️  WARNING: Hardcoded color detected
   Fix: Use AppTheme.colors instead of Color(0x...)
⚠️  WARNING: Use withValues(alpha: ) instead of withOpacity()
   Fix: Replace .withOpacity(0.5) with .withValues(alpha: 0.5)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️  2 warning(s) found
```

## 설정

### Hook 활성화 확인
[.claude/settings.local.json](../.claude/settings.local.json):
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/hooks/validator.sh \"$FILE_PATH\"",
            "statusMessage": "Validating Clean Architecture rules..."
          }
        ]
      }
    ]
  }
}
```

### Hook 비활성화
검증을 일시적으로 비활성화하려면:

1. **전체 비활성화**:
   ```json
   {
     "disableAllHooks": true
   }
   ```

2. **특정 Hook만 제거**:
   `settings.local.json`에서 `hooks` 섹션 삭제

## 비용 비교

| 방식 | 토큰/일 | 비용/월 | 속도 | 정확도 |
|------|---------|---------|------|--------|
| **정적 검증 (현재)** | **0** | **$0** ✅ | **즉시** | **90%** |
| AI 검증 (Haiku) | 10,000 | $15 💰 | 5초 | 95% |
| AI 검증 (Sonnet) | 50,000 | $75 💰💰 | 20초 | 98% |

## 확장하기

새로운 규칙을 추가하려면 [validator.sh](validator.sh) 편집:

```bash
# ============================================
# Rule 11: 새로운 규칙
# ============================================
if [[ 조건 ]]; then
  if ! [[ 검증 로직 ]]; then
    echo -e "${RED}❌ ERROR: 에러 메시지${NC}"
    echo "   Fix: 해결 방법"
    ERRORS=$((ERRORS + 1))
  fi
fi
```

## 트러블슈팅

### Hook이 실행되지 않음
1. 실행 권한 확인:
   ```bash
   ls -la .claude/hooks/validator.sh
   # -rwxr-xr-x (x 권한 필요)
   ```

2. 권한 추가:
   ```bash
   chmod +x .claude/hooks/validator.sh
   ```

3. `settings.local.json` 권한 확인:
   ```json
   {
     "permissions": {
       "allow": [
         "Bash(./.claude/hooks/validator.sh:*)"
       ]
     }
   }
   ```

### 검증이 너무 엄격함
경고(WARNING)는 수정을 차단하지 않습니다. 에러(ERROR)만 차단합니다.

필요시 특정 규칙을 WARNING으로 변경:
```bash
# ERROR → WARNING로 변경
echo -e "${YELLOW}⚠️  WARNING: ...${NC}"
WARNINGS=$((WARNINGS + 1))  # ERRORS 대신 WARNINGS
```

## 다음 단계

1. **Git Pre-commit Hook 추가**: 커밋 전 자동 검증
2. **CI/CD 통합**: PR 생성 시 자동 검증
3. **AI 하이브리드**: 복잡한 규칙은 AI 검증 추가

---

**참고**: 이 검증기는 토큰을 소비하지 않는 정적 분석 도구입니다. 복잡한 비즈니스 로직 검증은 AI 에이전트를 사용하세요.
