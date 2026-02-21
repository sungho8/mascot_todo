# Mascot Todo 프로젝트 기획서

> **Notion 원본**: [Mascot Todo 상세 기획서](https://www.notion.so/Mascot-Todo-306f1e1ec7168004995fc6bda9909a76)
> **마지막 업데이트**: 2026-02-13

---

## 1. 서비스 개요

- **서비스명**: Mascot Todo
- **핵심 컨셉**: 할 일을 완료하여 귀여운 마스코트를 수집하고 성장시키는 게이미피케이션 기반 Todo 앱.
- **주요 타겟**: 성취감을 시각적으로 확인하고 싶어 하는 유저, 캐릭터 수집을 좋아하는 유저.

---

## 2. 네비게이션 구조 (Navigation Tabs)

앱은 하단 탭바를 통해 4개의 주요 화면으로 구성됩니다:

| 탭 | 아이콘 | 주요 기능 |
|---|---|---|
| 홈 | 🏠 | Todo 리스트, 오늘의 집중 과제 |
| 마스코트 | 🎨 | 보유/미획득 마스코트 갤러리 |
| 통계 | 📊 | 달력 히트맵, 완료 기록 |
| 설정 | ⚙️ | 알림, 테마, 프로필 |

---

## 3. 핵심 시스템 로직 (Core Logic)

### ✅ 마스코트에게 TODO 요청

- 마스코트 화면에서 현재 활성 마스코트(예: 코코)에게 직접 할 일을 요청할 수 있습니다.
- 마스코트에게 "이거 해줘!"라고 탭하면 TODO 입력창이 열리고, 생성된 TODO는 해당 마스코트에 자동 연결됩니다.
- Todo 완료 시, 연결된 마스코트가 '기쁨' 애니메이션과 함께 경험치를 획득합니다.

### ✅ 마스코트 획득 (Unlock System)

- **기본 제공**: 최초 가입 시 기본 마스코트 1종 제공.
- **업적 달성**: 특정 조건을 만족하면 새로운 마스코트 잠금이 해제됩니다.
  - 예: "연속 3일 달성", "총 10개 Todo 완료", "새벽 5시에 5번 일어나기" 등

### ✅ 마스코트 성장 (Level-up)

- Todo 완료 시 경험치(`EXP`)가 상승합니다.
- 레벨이 오를수록 마스코트의 외형이 변화하거나 특수 효과(이펙트)가 추가됩니다.

---

## 4. 데이터 모델 설계 (Technical Spec for Claude)

```dart
// Claude가 코드로 변환할 핵심 객체 모델링
class Todo {
  String id;
  String title;
  bool isCompleted;
  String linkedMascotId; // TODO 요청을 받은 마스코트의 ID (자동 설정)
  DateTime targetDate;
}

class Mascot {
  String id;
  String name;
  String imagePath;
  int level;
  double currentExp;
  bool isLocked;
  String unlockCondition; // "연속 3일 달성" 등 설명
}

class UserStats {
  int totalCompleted;
  int currentStreak; // 현재 연속 달성 일수
  List<DateTime> completionHistory;
}
```

---

## 5. 화면별 상세 요구사항

### [홈 탭]

- 상단에 '오늘의 집중 과제'를 크게 배치하여 몰입 유도.
- 각 Todo 아이템 우측에 요청한 마스코트의 아이콘 노출.
- 하단에 현재 주력으로 키우는 마스코트의 전체 레벨업 게이지 표시.

### [마스코트 탭]

- 보유 중인 마스코트는 컬러로, 미획득은 회색(Grayscale)으로 표시.
- 미획득 마스코트 클릭 시 "새벽에 5번 일어나기"와 같은 힌트 팝업 노출.
- 활성 마스코트를 탭하면 "할 일 맡기기" 버튼이 등장하여 TODO 생성 플로우로 진입.
- 마스코트가 할당받은 미완료 TODO 목록을 마스코트 카드 하단에 표시.

### [통계 탭]

- **달력 뷰**: Todo를 많이 완료한 날일수록 색상이 진해지는 히트맵 방식.
- 특정 날짜 클릭 시 그날 획득한 경험치와 마스코트 변화 기록 확인.

### [설정 탭]

- **달력 뷰**: Todo를 많이 완료한 날엔 완료한 TODO의 마스코트 배치.
- 특정 날짜 클릭 시 그날 획득한 경험치와 마스코트 변화 기록 확인.

---

## 다음 단계

- [ ] Clean Architecture 기반 폴더 구조 구성
- [ ] Entity/Model 클래스 생성 (Freezed 적용)
- [ ] Repository 인터페이스 및 구현체 작성
- [ ] ViewModel 및 State 관리 (Riverpod)
- [ ] UI 컴포넌트 구현 (MVVM 패턴)
