#!/bin/bash

# ============================================
# Flutter Clean Architecture Static Validator
# ============================================
# 비용: $0 (토큰 소비 없음)
# 속도: 즉시 (밀리초 단위)
#
# 검증 규칙:
# 1. Freezed 3.0: abstract class 필수
# 2. Either 패턴: Repository는 Either<Failure, T> 반환
# 3. Export 순서: 알파벳 순 정렬
# 4. JsonSerializable: Model에만 사용
# 5. Riverpod: ref.watch는 build()에만

set -e

FILE_PATH="$1"
FILE_NAME=$(basename "$FILE_PATH")
FILE_CONTENT=$(cat "$FILE_PATH" 2>/dev/null || echo "")

ERRORS=0
WARNINGS=0

# 색상 코드
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Validating: $FILE_NAME${NC}"

# ============================================
# Rule 1: Freezed 3.0 - abstract class 필수
# ============================================
if echo "$FILE_CONTENT" | grep -q "@freezed"; then
  if ! echo "$FILE_CONTENT" | grep -q "abstract class"; then
    echo -e "${RED}❌ ERROR: Freezed 3.0 requires 'abstract class'${NC}"
    echo "   Fix: Change 'class' to 'abstract class'"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "${GREEN}✅ Freezed abstract class${NC}"
  fi
fi

# ============================================
# Rule 2: Either 패턴 - Repository 반환 타입
# ============================================
if [[ "$FILE_PATH" == *"repository"* ]] && [[ "$FILE_PATH" != *"_impl"* ]]; then
  # Repository 인터페이스는 Either<Failure, T> 반환 필수
  if echo "$FILE_CONTENT" | grep -q "Future<"; then
    if ! echo "$FILE_CONTENT" | grep -q "Future<Either<Failure"; then
      echo -e "${RED}❌ ERROR: Repository must return Future<Either<Failure, T>>${NC}"
      echo "   Found: Future<T> (incorrect)"
      echo "   Fix: Change to Future<Either<Failure, T>>"
      ERRORS=$((ERRORS + 1))
    else
      echo -e "${GREEN}✅ Either pattern in Repository${NC}"
    fi
  fi
fi

# ============================================
# Rule 3: Export 순서 - 알파벳 정렬
# ============================================
if [[ "$FILE_NAME" == "domain.dart" ]] || [[ "$FILE_NAME" == "di.dart" ]]; then
  # Export 문 추출 (/// 주석 제외)
  EXPORTS=$(echo "$FILE_CONTENT" | grep "^export " | grep -v "^///" || true)

  if [ -n "$EXPORTS" ]; then
    SORTED_EXPORTS=$(echo "$EXPORTS" | sort)

    if [ "$EXPORTS" != "$SORTED_EXPORTS" ]; then
      echo -e "${YELLOW}⚠️  WARNING: Exports are not alphabetically sorted${NC}"
      echo "   Fix: Sort export statements alphabetically"
      WARNINGS=$((WARNINGS + 1))
    else
      echo -e "${GREEN}✅ Export order${NC}"
    fi
  fi
fi

# ============================================
# Rule 4: JsonSerializable - Model에만 사용
# ============================================
if echo "$FILE_CONTENT" | grep -q "@JsonSerializable"; then
  if [[ "$FILE_PATH" != *"model"* ]]; then
    echo -e "${RED}❌ ERROR: @JsonSerializable should only be in Model files${NC}"
    echo "   Current file: $FILE_PATH"
    echo "   Fix: Remove @JsonSerializable or move to Model file"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "${GREEN}✅ JsonSerializable in Model${NC}"
  fi
fi

# ============================================
# Rule 5: Model toEntity() 메서드 필수
# ============================================
if [[ "$FILE_PATH" == *"model.dart" ]]; then
  if echo "$FILE_CONTENT" | grep -q "@freezed"; then
    if ! echo "$FILE_CONTENT" | grep -q "toEntity()"; then
      echo -e "${YELLOW}⚠️  WARNING: Model should have toEntity() method${NC}"
      echo "   Fix: Add toEntity() method for Model → Entity conversion"
      WARNINGS=$((WARNINGS + 1))
    else
      echo -e "${GREEN}✅ toEntity() method exists${NC}"
    fi
  fi
fi

# ============================================
# Rule 6: Entity는 JsonSerializable 금지
# ============================================
if [[ "$FILE_PATH" == *"entity.dart" ]]; then
  if echo "$FILE_CONTENT" | grep -q "@JsonSerializable"; then
    echo -e "${RED}❌ ERROR: Entity should NOT use @JsonSerializable${NC}"
    echo "   Fix: Remove @JsonSerializable from Entity (use in Model only)"
    ERRORS=$((ERRORS + 1))
  else
    echo -e "${GREEN}✅ Entity without JsonSerializable${NC}"
  fi
fi

# ============================================
# Rule 7: Riverpod ref.watch는 build()에만
# ============================================
if [[ "$FILE_PATH" == *"viewmodel"* ]] || [[ "$FILE_PATH" == *"view.dart" ]]; then
  # ref.watch가 build() 외부에 있는지 체크 (간단한 휴리스틱)
  if echo "$FILE_CONTENT" | grep -B 5 "ref.watch" | grep -q "void\|Future<void>\|onPressed\|onTap"; then
    echo -e "${YELLOW}⚠️  WARNING: ref.watch might be used outside build()${NC}"
    echo "   Fix: Use ref.read for event handlers, ref.watch only in build()"
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ============================================
# Rule 8: 하드코딩된 색상/크기 금지
# ============================================
if [[ "$FILE_PATH" == *"view.dart" ]] || [[ "$FILE_PATH" == *"widget"* ]]; then
  if echo "$FILE_CONTENT" | grep -q "Color(0x"; then
    echo -e "${YELLOW}⚠️  WARNING: Hardcoded color detected${NC}"
    echo "   Fix: Use AppTheme.colors instead of Color(0x...)"
    WARNINGS=$((WARNINGS + 1))
  fi

  if echo "$FILE_CONTENT" | grep -qE "fontSize:\s*[0-9]+"; then
    echo -e "${YELLOW}⚠️  WARNING: Hardcoded font size detected${NC}"
    echo "   Fix: Use AppTheme.textStyles instead of hardcoded sizes"
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ============================================
# Rule 9: withOpacity 대신 withValues 사용
# ============================================
if echo "$FILE_CONTENT" | grep -q "withOpacity"; then
  echo -e "${YELLOW}⚠️  WARNING: Use withValues(alpha: ) instead of withOpacity()${NC}"
  echo "   Fix: Replace .withOpacity(0.5) with .withValues(alpha: 0.5)"
  WARNINGS=$((WARNINGS + 1))
fi

# ============================================
# Rule 10: RoutePath 사용 (하드코딩 경로 금지)
# ============================================
if [[ "$FILE_PATH" == *"view.dart" ]] || [[ "$FILE_PATH" == *"viewmodel"* ]]; then
  if echo "$FILE_CONTENT" | grep -qE "context\.go\(['\"]\/"; then
    echo -e "${YELLOW}⚠️  WARNING: Hardcoded route path detected${NC}"
    echo "   Fix: Use RoutePath.login instead of '/login'"
    WARNINGS=$((WARNINGS + 1))
  fi
fi

# ============================================
# 결과 출력
# ============================================
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
  echo -e "${GREEN}✨ All validation checks passed!${NC}"
  exit 0
elif [ $ERRORS -eq 0 ]; then
  echo -e "${YELLOW}⚠️  $WARNINGS warning(s) found${NC}"
  exit 0
else
  echo -e "${RED}❌ $ERRORS error(s), $WARNINGS warning(s) found${NC}"
  echo ""
  echo "Validation failed. Please fix the errors above."
  exit 1
fi
