import 'package:learn_dart_together/04_inheritance/slime/slime.dart';

import 'hero.dart';

class PoisonSlime extends Slime {
  int attackableCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (attackableCount <= 0) return;
    final damage = hero.hp ~/ 5;
    hero.hp -= damage;
    attackableCount -= 1;

    print('추가로, 독 포자를 살포했다!');
    print('$damage포인트의 데미지');
  }
}
