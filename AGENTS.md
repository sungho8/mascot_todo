# 🤖 AGENTS.md (에이전트 헌법)

이 문서는 Mascot Todo 프로젝트에서 Antigravity 에이전트가 자율적으로 작업을 수행하기 위한 지침서이자 '프로젝트 헌법'입니다. 에이전트는 모든 작업 시 이 문서를 최우선으로 참고합니다.

---

## 🚀 1. 자율 동작을 위한 핵심 세팅

에이전트의 자율성을 극대화하기 위해 다음 3단계를 권장합니다.

1.  **Planning 모드 활성화**: 에이전트 패널에서 모드를 **Planning**으로 설정하세요. 그래야 에이전트가 스스로 Task List를 짜고 도구를 전략적으로 활용합니다.
2.  **터미널 자동 실행(Auto-execute) 허용**: 설정(Cmd + ,) > Antigravity > Terminal: Auto Execute를 **Auto** 또는 **Turbo**로 변경하세요. 에이전트가 `fvm` 명령어를 묻지 않고 즉시 실행합니다.
3.  **브라우저 도구 적극 활용**: UI 수정 시 "브라우저를 열어서 결과물이 기획대로 나오는지 확인해줘"라고 명령하세요. 에이전트가 직접 검증하고 보고합니다.

---

## 🎯 2. 에이전트 길들이기 규칙 (프로젝트 헌법)

### ✅ 필수 워크플로우
- **작업 전 검토**: 새로운 기능을 구현하기 전 반드시 `swagger-spec.json` 및 `PRODUCT_SPEC.md`를 확인합니다.
- **코드 생성**: `@freezed`, `@riverpod` 수정 시 반드시 `fvm dart run build_runner build --delete-conflicting-outputs`를 실행합니다.
- **검증 포함**: "로그인 페이지를 만들고, 직접 개발 서버를 띄워서 브라우저로 접속해봐. 그 다음 테스트 결과를 알려줘"와 같이 검증 단계를 포함하여 명령하세요.
- **병렬 작업**: Agent Manager를 통해 백엔드와 프론트엔드 작업을 동시에 시키고 결과만 승인하세요.

### 🛠️ 코딩 표준 (Strict Rules)
- **언어**: 모든 답변과 문서는 **한글(Korean)**로 작성합니다.
- **아키텍처**: Clean Architecture & MVVM 패턴을 엄격히 준수합니다.
- **모델링**: Freezed 3.0을 사용하며, `abstract class` 형식을 유지합니다.
- **Export**: 새로운 엔티티/리포지토리/유즈케이스 생성 시 `lib/domain/domain.dart`와 `lib/di/di.dart`에 즉시 추가합니다.
- **에러 핸들링**: `handleAuthError`와 `Either` 패턴을 사용하여 에러를 Presentation 레이어까지 안전하게 전달합니다.
- **UI**: 하드코딩을 금지하고 `AppTheme`, `AppSpace`, `AppConstants`를 활용합니다. `withOpacity` 대신 `.withValues(alpha: ...)`를 사용합니다.

---

## 💡 3. 유의 사항 및 팁

- **토큰 절약**: 에이전트가 작성한 '작업 계획(Planning)'이 의도와 다르면 즉시 피드백을 주어 불필요한 코드 작성을 방지하세요.
- **모델 스위칭**: 복잡한 설계는 **Gemini 1.5 Pro** 또는 **Sonnet 3.5**에게, 단순 검증이나 반복 작업은 **Flash** 모델을 활용하여 성능과 비용을 최적화하세요.
- **Artifact 활용**: 작업 결과물은 Artifact로 보고하게 하여 전체 맥락을 한눈에 파악하세요.

---

> [!TIP]
> **"직접 확인까지 해"**라고 한 마디만 덧붙여도 에이전트의 업무 퀄리티가 비약적으로 상승합니다.
