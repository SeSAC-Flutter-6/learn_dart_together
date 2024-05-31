import 'package:learn_dart_together/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('selfAid시()를 하면 초기값이 정해지지 않은 클레릭은 체력이 50이다.', () {
    final cleric = Cleric(name: "클레릭");
    cleric.selfAid();
    expect(cleric.hp, equals(50));
  });

  test('selfAid()를 하면 최대 체력이 되어야 한다.', () {
    final cleric = Cleric(name: "클레릭", hp: 37, maxHp: 40);
    cleric.selfAid();
    expect(cleric.hp, equals(cleric.maxHp));
  });

  test('selfAid()를 하면 마나가 5 줄어들어야 한다.', () {
    final cleric = Cleric(name: "클레릭");
    final mp = cleric.mp;
    cleric.selfAid();
    expect(cleric.mp, equals(mp - 5));
  });

  test('selfAid()를 할 때 마나가 없으면 HP 회복이 되지 않는다', () {
    final cleric = Cleric(name: "클레릭", mp: 4, hp: 37);
    cleric.selfAid();
    expect(cleric.hp, isNot(cleric.maxHp));
  });

  test('pray()를 하면 기도 시간 + 0~2의 마나만큼 회복한 량을 return 해야한다.', () {
    final cleric = Cleric(name: "클레릭", mp: 1);
    final mp = cleric.mp;
    final result = cleric.pray(1);
    expect(true, equals(result >= mp + 1 && result <= mp + 3));
  });

  test('pray()를 할 때 회복량이 max mp 초과시 maxmp에서 기존 mp를 뺀 값을 return 해야한다.', () {
    final cleric = Cleric(name: "클레릭", mp: 6);
    cleric.pray(8);

    expect(cleric.maxMp - cleric.mp, equals(4));
  });
}
