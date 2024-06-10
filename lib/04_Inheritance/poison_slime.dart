
import 'package:learn_dart_together/01_instance_class/slime.dart';
import '../01_instance_class/hero.dart';

class PoisonSlime extends Slime {
  int attackPoint = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (attackPoint > 0) {
      attackPoint--;
      print('독 포자를 살포했다!');
      print('${(hero.hp ~/ 5)}의 데미지');
      hero.hp -= (hero.hp ~/ 5);
    }
  }
}