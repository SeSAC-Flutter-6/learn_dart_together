import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

class PoisonSlime extends Slime {
  int poisonAttackLeft = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonAttackLeft > 0) {
      poisonAttackLeft -= 1;
      print('추가로 독 포자를 살포했다!');
      if (hero.hp > 0) {
        final double damage = hero.hp * 0.2;
        hero.hp -= damage;
        print('$damage의 데미지');
      } else {
        print('용사가 이미 죽었습니다.');
      }
    } else {
      print('남은 독 공격이 없습니다.');
    }
  }
}
