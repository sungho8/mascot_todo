#!/bin/bash

# ============================================
# 전체 프로젝트 검증 스크립트
# ============================================

set -e

VALIDATOR_SCRIPT="./.claude/hooks/validator.sh"
TOTAL_FILES=0
PASSED_FILES=0
FAILED_FILES=0
WARNING_FILES=0

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🔍 Flutter Clean Architecture Validation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 검증할 파일 패턴
PATTERNS=(
  "lib/domain/entities/**/*.dart"
  "lib/data/models/**/*.dart"
  "lib/data/repositories_impl/**/*.dart"
  "lib/domain/repositories/**/*.dart"
  "lib/presentation/viewmodels/**/*.dart"
  "lib/presentation/views/**/*.dart"
  "lib/domain/domain.dart"
  "lib/di/di.dart"
)

for PATTERN in "${PATTERNS[@]}"; do
  # Glob 패턴을 쉘 패턴으로 변환
  SHELL_PATTERN=$(echo "$PATTERN" | sed 's/\*\*/*/g')

  for FILE in $SHELL_PATTERN; do
    if [ -f "$FILE" ]; then
      TOTAL_FILES=$((TOTAL_FILES + 1))

      # 검증 실행 (출력 캡처)
      if OUTPUT=$("$VALIDATOR_SCRIPT" "$FILE" 2>&1); then
        # 경고가 있는지 확인
        if echo "$OUTPUT" | grep -q "WARNING"; then
          WARNING_FILES=$((WARNING_FILES + 1))
          echo "⚠️  $FILE (warnings)"
        else
          PASSED_FILES=$((PASSED_FILES + 1))
          echo "✅ $FILE"
        fi
      else
        FAILED_FILES=$((FAILED_FILES + 1))
        echo "❌ $FILE"
        echo "$OUTPUT" | grep -E "ERROR|WARNING" | sed 's/^/   /'
      fi
    fi
  done
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Validation Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Total files:    $TOTAL_FILES"
echo "✅ Passed:      $PASSED_FILES"
echo "⚠️  Warnings:    $WARNING_FILES"
echo "❌ Failed:      $FAILED_FILES"
echo ""

if [ $FAILED_FILES -eq 0 ]; then
  echo "✨ All validation checks passed!"
  exit 0
else
  echo "❌ $FAILED_FILES file(s) failed validation"
  exit 1
fi
