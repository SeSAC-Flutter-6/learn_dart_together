import 'dart:math';

import 'package:learn_dart_together/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('selfAid()', () {
    test('selfAid()를 하면 초기값이 정해지지 않은 클레릭은 체력이 50이다.', () {
      final cleric = Cleric(name: '클레릭');
      cleric.selfAid();
      expect(cleric.hp, equals(50));
    });

    test('selfAid()를 하면 최대 체력이 되어야 한다.', () {
      final cleric = Cleric(name: '클레릭', hp: 37, mp: 5);
      cleric.selfAid();
      expect(cleric.hp, equals(cleric.maxHp));
    });

    test('selfAid()를 하면 마나가 5 줄어들어야 한다.', () {
      final cleric = Cleric(name: '클레릭', mp: 7);
      final mp = cleric.mp;
      cleric.selfAid();
      expect(cleric.mp, equals(mp - 5));
    });

    test('selfAid()를 할 때 마나가 없으면 HP 회복이 되지 않는다', () {
      final cleric = Cleric(name: '클레릭', mp: 4, hp: 37);
      cleric.selfAid();
      expect(cleric.hp, isNot(cleric.maxHp));
    });
  });

  group('pray()', () {
    // setUp : group화 하여도 test Code 실행시 다시 실행
    // setUpAll : test code가 다시 실행되어도 1번만 실행 됨.
    // setUpAll(() {
    //   cleric = Cleric(name: '기본성직자');
    // });

    test('pray()를 하면 기도 시간 + 0~2의 마나만큼 회복한 량을 return 해야한다.', () {
      final mp = 1;
      final cleric = Cleric(name: '클레릭', mp: mp);
      final preySecond = 3;
      final prayResult = cleric.pray(preySecond);

      expect(cleric.mp, equals(mp + prayResult));
      expect(prayResult, lessThanOrEqualTo(preySecond + 2));
      expect(prayResult, greaterThanOrEqualTo(preySecond));
    });

    test('pray()를 할 때 회복량이 maxMp 초과시 maxMp에서 기존 mp를 뺀 값을 return 해야한다.', () {
      final mp = 6;
      final cleric = Cleric(name: '클레릭', mp: mp);
      final mpRecovery = cleric.pray(8);

      expect(cleric.mp, equals(cleric.maxMp));
      expect(mpRecovery, equals(cleric.maxMp - mp));
    });
  });
}
