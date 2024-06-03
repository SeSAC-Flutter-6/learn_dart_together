import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'dart:math';

void main() {
  final seed = 37;

  final int fixedHp = Random(seed).nextInt(51); // 0부터 50까지의 랜덤한 HP
  final int fixedMp = Random(seed).nextInt(11); // 0부터 10까지의 랜덤한 MP
  final int prayerTime = Random(seed).nextInt(60) + 1; // 1부터 60까지의 랜덤한 기도 시간

  test(
      'pray()을 하면 mp를 회복함. 회복량은 기도한 시간(초)에 0 ~ 2포인트의 보정을 한 양. 최대 MP와 같거나 이하로 회복',
      () {
    final cleric = Cleric(name: '성직자', hp: fixedHp, mp: fixedMp);

    final int prevMp = cleric.mp;
    final int realRecoveredMp = cleric.pray(prayerTime);

    expect(prevMp <= cleric.mp && realRecoveredMp <= cleric.maxMp - prevMp,
        isTrue);
  });

  test('selfAid()을 하면 MP를 5소비하는 것으로 자신의 HP 를 최대 HP 까지 회복할 수 있다', () {
    final cleric = Cleric(name: '성직자', hp: fixedHp, mp: fixedMp);

    final int prevMp = cleric.mp;
    final int prevHp = cleric.hp;

    cleric.selfAid();

    if (prevMp >= 5) {
      expect(cleric.hp, equals(cleric.maxHp));
      expect(cleric.mp, equals(prevMp - 5));
    } else {
      // MP가 5 미만이면 HP를 회복하지 않으므로, MP와 HP가 변하지 않아야 함
      expect(cleric.hp, equals(prevHp));
      expect(cleric.mp, equals(prevMp));
    }
  });
}
