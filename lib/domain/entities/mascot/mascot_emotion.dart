/// 마스코트가 표현할 수 있는 감정 상태
enum MascotEmotion {
  neutral,
  happy,
  sad;

  /// 문자열에서 감정 상태를 파싱합니다.
  static MascotEmotion fromString(String? emotionStr) {
    if (emotionStr == null) return MascotEmotion.neutral;
    switch (emotionStr.toLowerCase().trim()) {
      case 'happy':
        return MascotEmotion.happy;
      case 'sad':
        return MascotEmotion.sad;
      default:
        return MascotEmotion.neutral;
    }
  }
}
