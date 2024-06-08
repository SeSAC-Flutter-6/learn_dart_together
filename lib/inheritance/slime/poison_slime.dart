import 'package:learn_dart_together/inheritance/slime/slime.dart';

import '../../hero.dart';

class PoisonSlime extends Slime {
   static int poisonAttackCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonAttackCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      print('${hero.hp ~/ 5}포인트의 데미지');
      hero.hp -= hero.hp ~/ 5;
      poisonAttackCount -= 1;
    }
  }
}
