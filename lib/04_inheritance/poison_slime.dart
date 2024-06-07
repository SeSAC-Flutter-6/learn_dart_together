import 'package:learn_dart_together/04_inheritance/hero.dart';
import 'package:learn_dart_together/04_inheritance/slime.dart';

class PoisonSlime extends Slime {
  int _poisonAttackCount = 5;

  PoisonSlime(super.suffix);

  @override
  //독슬라임은 기본슬라임 HP의 2배!
  int get hp => super.hp * 2;

  int get poisonAttackCount => _poisonAttackCount;

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_poisonAttackCount <= 0) {
      print('독 데미지 공격 모두 소모.');
      return;
    }
    print('추가로, 독 포자를 살포했다!');
    hero.hp -= hero.hp ~/ 5;
    print('${hero.hp ~/ 5}포인트의 추가 데미지 입힘');
    _poisonAttackCount--;
  }
}
