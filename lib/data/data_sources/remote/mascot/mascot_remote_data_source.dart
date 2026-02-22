import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../models/mascot/mascot_model.dart';

/// Mascot Remote DataSource
class MascotRemoteDataSource {
  final SupabaseClient _client;

  MascotRemoteDataSource(this._client);

  /// 전체 마스코트 목록 조회
  /// 마스터 데이터 전체(6종) + 유저 보유 데이터(level/exp/isUnlocked) 병합 반환
  Future<List<MascotModel>> getMascots() async {
    // 1. 마스터 마스코트 전체 조회 (잠긴 마스코트 포함)
    final masterResponse = await _client
        .from('mascots')
        .select()
        .order('created_at', ascending: true);

    final masterList = List<Map<String, dynamic>>.from(masterResponse as List);

    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      return masterList.map((json) => MascotModel.fromJson(json)).toList();
    }

    // 2. 유저가 보유한 마스코트 조회 (mascot_id → level/exp 매핑)
    final userResponse = await _client
        .from('user_mascots')
        .select('mascot_id, current_level, current_exp')
        .eq('user_id', userId);

    final userMascotMap = <String, Map<String, dynamic>>{};
    for (final um in userResponse as List) {
      userMascotMap[um['mascot_id'] as String] = um;
    }

    // 3. 병합: 보유한 마스코트면 실제 level/exp + isUnlocked=true
    return masterList.map((master) {
      final userMascot = userMascotMap[master['id'] as String];
      if (userMascot != null) {
        return MascotModel.fromJson({
          ...master,
          'level': userMascot['current_level'],
          'current_exp': userMascot['current_exp'],
          'max_exp': (master['exp_per_level'] as int? ?? 100).toDouble(),
          'is_unlocked': true,
        });
      }
      return MascotModel.fromJson({
        ...master,
        'max_exp': (master['exp_per_level'] as int? ?? 100).toDouble(),
      });
    }).toList();
  }

  /// 유저의 메인 마스코트 조회 (is_main = true 우선, 없으면 첫 번째 보유 마스코트)
  Future<MascotModel?> getMostUsedMascot() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) return null;

    // is_main = true 우선 조회
    Map<String, dynamic>? response = await _client
        .from('user_mascots')
        .select('*, mascots(*)')
        .eq('user_id', userId)
        .eq('is_main', true)
        .maybeSingle();

    // is_main 없으면 가장 먼저 언락된 마스코트로 fallback
    if (response == null) {
      final all = await _client
          .from('user_mascots')
          .select('*, mascots(*)')
          .eq('user_id', userId)
          .order('unlocked_at', ascending: true)
          .limit(1);
      final list = all as List;
      if (list.isEmpty) return null;
      response = list.first as Map<String, dynamic>;
    }

    final master = response['mascots'] as Map<String, dynamic>;
    return MascotModel.fromJson({
      ...master,
      'level': response['current_level'],
      'current_exp': response['current_exp'],
      'max_exp': (master['exp_per_level'] as int? ?? 100).toDouble(),
      'is_unlocked': true,
    });
  }

  /// 특정 마스코트 조회
  Future<MascotModel> getMascotById(String mascotId) async {
    final response = await _client
        .from('mascots')
        .select()
        .eq('id', mascotId)
        .single();

    return MascotModel.fromJson(response);
  }

  /// 사용자의 마스코트 목록 조회 (User Mascots)
  /// MascotMaster 데이터와 UserMascot 데이터를 Join 하여 가져옵니다.
  Future<List<MascotModel>> getUserMascots(String userId) async {
    final response = await _client
        .from('user_mascots')
        .select('''
          *,
          mascots (*)
        ''')
        .eq('user_id', userId);

    return (response as List).map((json) {
      final master = json['mascots'] as Map<String, dynamic>;
      return MascotModel.fromJson({
        ...master,
        'level': json['current_level'],
        'current_exp': json['current_exp'],
        'is_unlocked': true, // user_mascots 에 있으면 해금된 것
      });
    }).toList();
  }

  /// 마스코트 경험치 추가 및 레벨업 처리
  /// [userMascotId] user_mascots.id (todos.linked_mascot_id 참조값)
  Future<MascotModel> addExp(String userMascotId, double expGain) async {
    // 1. 현재 user_mascot + 마스터 데이터 조회
    final current = await _client
        .from('user_mascots')
        .select('*, mascots(*)')
        .eq('id', userMascotId)
        .single();

    final currentLevel = current['current_level'] as int;
    final currentExp = (current['current_exp'] as num).toDouble();
    final master = current['mascots'] as Map<String, dynamic>;
    final expPerLevel = (master['exp_per_level'] as int? ?? 100).toDouble();
    final maxLevel = master['max_level'] as int? ?? 10;

    // 2. 경험치 계산 및 레벨업 처리
    double newExp = currentExp + expGain;
    int newLevel = currentLevel;

    while (newExp >= expPerLevel && newLevel < maxLevel) {
      newExp -= expPerLevel;
      newLevel++;
    }

    // 3. Supabase 업데이트
    await _client
        .from('user_mascots')
        .update({'current_exp': newExp, 'current_level': newLevel})
        .eq('id', userMascotId);

    // 4. 업데이트된 모델 반환
    return MascotModel.fromJson({
      ...master,
      'level': newLevel,
      'current_exp': newExp,
      'max_exp': expPerLevel,
      'is_unlocked': true,
    });
  }
}
