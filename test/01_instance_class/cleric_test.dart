import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('selfAid() 하면 hp가 회복되어야 함', () {
    final cleric = Cleric('마법사', 30, 7);
    final cleric1 = Cleric('마술사', 30, 0);
    cleric.selfAid();
    cleric1.selfAid();
    expect(cleric.hp, 50);
    expect(cleric.mp, 2);
    expect(cleric1.hp, 30);
    expect(cleric1.mp, 0);
  });

  test('pray()하면 mp가 회복되어야 함', () {
    final cleric2 = Cleric('해리', 20, 2);
    final cleric3 = Cleric('론', 45, 8);
    cleric2.pray(3);
    cleric3.pray(10);
    expect(cleric2.mp, lessThanOrEqualTo(8));
    expect(cleric2.mp, greaterThanOrEqualTo(5));
    expect(cleric3.mp, 10);
  });
}
