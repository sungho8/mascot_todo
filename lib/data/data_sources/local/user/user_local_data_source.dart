import '../../../models/user/user_model.dart';

/// User Local DataSource
class UserLocalDataSource {
  /// 현재 사용자 정보 조회 (더미 데이터)
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const UserModel(
      id: 'user1',
      name: '홍길동',
      profileImagePath: null,
      level: 12,
      currentExp: 850,
      maxExp: 1200,
      totalCompleted: 145,
      currentStreak: 7,
    );
  }
}
