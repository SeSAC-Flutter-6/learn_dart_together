import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('selfAid() 하면 hp가 회복되어야 함', () {
    final cleric = Cleric(name: '마법사', hp: 30, mp: 7);
    final cleric1 = Cleric(name: '마술사', hp: 30, mp: 0);
    cleric.selfAid();
    cleric1.selfAid();
    expect(cleric.hp, 50);
    expect(cleric.mp, 2);
    expect(cleric1.hp, 30);
    expect(cleric1.mp, 0);
  });

  test('pray()하면 mp가 회복되어야 함', () {
    final cleric2 = Cleric(name: '해리', hp: 20, mp: 2);
    final cleric3 = Cleric(name: '론', hp: 45, mp: 8);
    cleric2.pray(3);
    cleric3.pray(10);
    expect(cleric2.mp, lessThanOrEqualTo(7));
    expect(cleric2.mp, greaterThanOrEqualTo(5));
    expect(cleric3.mp, 10);
  });
}
