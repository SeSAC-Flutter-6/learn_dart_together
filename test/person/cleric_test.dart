import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  late Cleric cleric;
  final int defaultHp = 50;
  final int defaultMp = 10;

  setUpAll(() {
    cleric = Cleric('클레릭');
  });

  group('constructor()', () {
    test('클레릭의 defaul 값은 hp는 50, mp는 10이다.', () {
      cleric = Cleric('클래릭');
      expect([cleric.hp, cleric.mp], equals([defaultHp, defaultMp]));
      expect([Cleric.maxHp, Cleric.maxMp], equals([defaultHp, defaultMp]));
    });


    final hp = 37;
    final mp = 5;
    test('클레릭의 hp 지정 test', () {
      cleric = Cleric('클래릭', hp: hp);
      expect(cleric.hp, equals(hp));
      expect(cleric.mp, equals(Cleric.maxMp));
    });


    test('클레릭의 hp, mp 값 지정 test', () {
      cleric = Cleric('클래릭', hp: hp, mp: mp);
      expect(cleric.hp, equals(hp));
      expect(cleric.mp, equals(mp));
    });


  });

  group('selfAid()', () {
    test('selfAid()를 하면 최대 체력이 되어야 한다.', () {
      final hp = 37;
      final mp = 5;
      cleric.hp = hp;
      cleric.mp = mp;

      cleric.selfAid();

      expect(cleric.hp, equals(Cleric.maxHp));
      expect(cleric.mp, equals(mp - Cleric.selfAidCost));
    });

    test('selfAid()를 할 때 마나가 없으면 HP 회복이 되지 않는다', () {
      final hp = 37;
      final mp = 4;
      cleric.hp = hp;
      cleric.mp = mp;

      cleric.selfAid();

      expect(cleric.hp, isNot(Cleric.maxHp));
      expect(cleric.mp, equals(mp));
    });
  });

  group('pray()', () {
    test('pray()를 하면 기도 시간 + 0~2의 마나만큼 회복한 량을 return 해야한다.', () {
      final mp = 1;
      cleric.mp = mp;

      final praySecond = 3;
      final prayResult = cleric.pray(praySecond);

      expect(cleric.mp, equals(mp + prayResult));
      expect(
          prayResult, lessThanOrEqualTo(praySecond + Cleric.prayRandomValue));
      expect(prayResult, greaterThanOrEqualTo(praySecond));
    });

    test('pray()를 할 때 회복량이 maxMp 초과시 maxMp에서 기존 mp를 뺀 값을 return 해야한다.', () {
      final mp = 6;
      cleric.mp = mp;

      final praySecond = 8;
      final mpRecovery = cleric.pray(praySecond);

      expect(cleric.mp, equals(Cleric.maxMp));
      expect(mpRecovery, equals(Cleric.maxMp - mp));
    });
  });
}
