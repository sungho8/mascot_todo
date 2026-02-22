import '../../../models/mascot/mascot_model.dart';

/// Mascot Local DataSource
class MascotLocalDataSource {
  /// 더미 마스코트 목록
  Future<List<MascotModel>> getMascots() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const MascotModel(
        id: '1',
        name: '코코',
        imagePath: 'assets/images/mascots/rabbit.png',
        level: 5,
        currentExp: 350,
        maxExp: 500,
        unlockConditionType: 'default',
        unlockConditionValue: 0,
        unlockDescription: '기본 제공',
        isDefault: true,
        isUnlocked: true,
      ),
      const MascotModel(
        id: '2',
        name: '루미',
        imagePath: 'assets/images/mascots/cat.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        unlockConditionType: 'streak',
        unlockConditionValue: 3,
        unlockDescription: '연속 3일 달성',
        isDefault: false,
        isUnlocked: false,
      ),
      const MascotModel(
        id: '3',
        name: '피피',
        imagePath: 'assets/images/mascots/dog.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        unlockConditionType: 'total_completed',
        unlockConditionValue: 10,
        unlockDescription: '총 10개 Todo 완료',
        isDefault: false,
        isUnlocked: false,
      ),
      const MascotModel(
        id: '4',
        name: '모모',
        imagePath: 'assets/images/mascots/bird.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        unlockConditionType: 'early_bird',
        unlockConditionValue: 5,
        unlockDescription: '새벽 5시에 5번 일어나기',
        isDefault: false,
        isUnlocked: false,
      ),
      const MascotModel(
        id: '5',
        name: '두두',
        imagePath: 'assets/images/mascots/panda.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        unlockConditionType: 'daily_completed',
        unlockConditionValue: 5,
        unlockDescription: '하루에 5개 이상 Todo 완료',
        isDefault: false,
        isUnlocked: false,
      ),
      const MascotModel(
        id: '6',
        name: '나나',
        imagePath: 'assets/images/mascots/owl.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        unlockConditionType: 'streak',
        unlockConditionValue: 7,
        unlockDescription: '연속 7일 달성',
        isDefault: false,
        isUnlocked: false,
      ),
    ];
  }

  /// 특정 마스코트 조회
  Future<MascotModel> getMascotById(String mascotId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final mascots = await getMascots();
    return mascots.firstWhere((m) => m.id == mascotId);
  }

  /// 가장 많이 사용된 마스코트 조회 (임시로 첫 번째 마스코트 반환)
  Future<MascotModel?> getMostUsedMascot() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final mascots = await getMascots();
    return mascots.isNotEmpty ? mascots.first : null;
  }
}
