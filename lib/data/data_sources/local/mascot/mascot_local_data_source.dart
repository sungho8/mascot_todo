import '../../../models/mascot/mascot_model.dart';

/// Mascot Local DataSource
class MascotLocalDataSource {
  /// 더미 마스코트 목록
  Future<List<MascotModel>> getMascots() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const MascotModel(
        id: '1',
        name: '토끼',
        imagePath: 'assets/images/mascots/rabbit.png',
        level: 5,
        currentExp: 350,
        maxExp: 500,
        isLocked: false,
      ),
      const MascotModel(
        id: '2',
        name: '고양이',
        imagePath: 'assets/images/mascots/cat.png',
        level: 3,
        currentExp: 120,
        maxExp: 300,
        isLocked: false,
      ),
      const MascotModel(
        id: '3',
        name: '강아지',
        imagePath: 'assets/images/mascots/dog.png',
        level: 1,
        currentExp: 0,
        maxExp: 100,
        isLocked: true,
        unlockCondition: '연속 3일 달성',
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
