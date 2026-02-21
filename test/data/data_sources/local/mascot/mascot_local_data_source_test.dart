import 'package:flutter_test/flutter_test.dart';
import 'package:mascot_todo/data/data_sources/local/mascot/mascot_local_data_source.dart';

void main() {
  late MascotLocalDataSource dataSource;

  setUp(() {
    dataSource = MascotLocalDataSource();
  });

  group('MascotLocalDataSource Tests', () {
    test(
      'getMascots returns all 6 approved mascots with correct names',
      () async {
        final mascots = await dataSource.getMascots();

        expect(mascots.length, 6);
        expect(mascots[0].name, '코코');
        expect(mascots[1].name, '루미');
        expect(mascots[2].name, '피피');
        expect(mascots[3].name, '모모');
        expect(mascots[4].name, '두두');
        expect(mascots[5].name, '나나');
      },
    );

    test('getMascotById returns correct mascot (Lumi)', () async {
      final mascot = await dataSource.getMascotById('2');
      expect(mascot.name, '루미');
    });

    test('Lumi (ID 2) is unlocked and assigned correct image path', () async {
      final mascot = await dataSource.getMascotById('2');
      expect(mascot.id, '2');
      expect(mascot.name, '루미');
      expect(mascot.imagePath, 'assets/images/mascots/cat.png');
      expect(mascot.isLocked, false);
    });

    test('Pipi (ID 3) is locked and has correct unlock condition', () async {
      final mascot = await dataSource.getMascotById('3');
      expect(mascot.isLocked, true);
      expect(mascot.unlockCondition, '총 10개 Todo 완료');
    });
  });
}
