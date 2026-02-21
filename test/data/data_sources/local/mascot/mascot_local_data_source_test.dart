import 'package:flutter_test/flutter_test.dart';
import 'package:mascot_todo/data/data_sources/local/mascot/mascot_local_data_source.dart';

void main() {
  late MascotLocalDataSource dataSource;

  setUp(() {
    dataSource = MascotLocalDataSource();
  });

  group('MascotLocalDataSource Tests', () {
    test('getMascots returns all 6 approved mascots', () async {
      final mascots = await dataSource.getMascots();

      expect(mascots.length, 6);
      expect(mascots[0].name, '코코');
      expect(mascots[1].name, '미미');
      expect(mascots[2].name, '바론');
      expect(mascots[3].name, '루루');
      expect(mascots[4].name, '파오');
      expect(mascots[5].name, '와이즐리');
    });

    test('getMascotById returns correct mascot', () async {
      final mascot = await dataSource.getMascotById('2');
      expect(mascot.name, '미미');
    });

    test('Mimi (ID 2) is unlocked and assigned correct image path', () async {
      final mascot = await dataSource.getMascotById('2');
      expect(mascot.id, '2');
      expect(mascot.name, '미미');
      expect(mascot.imagePath, 'assets/images/mascots/cat.png');
      expect(mascot.isLocked, false);
    });

    test('Lulu (ID 4) is locked and has unlock condition', () async {
      final mascot = await dataSource.getMascotById('4');
      expect(mascot.isLocked, true);
      expect(mascot.unlockCondition, isNotNull);
    });
  });
}
