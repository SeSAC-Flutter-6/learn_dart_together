import 'constants.dart';
import 'slime.dart';
import 'hero.dart';

class PoisonSlime extends Slime {
  int poisonAttackCount;

  PoisonSlime({
    required super.suffix,
    this.poisonAttackCount = poisonMaxAttackCount,
  });

  @override
  void attack(Hero hero) {
    if (poisonAttackCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      print('${hero.hp ~/ 5}의 데미지');
      hero.hp -= hero.hp ~/ 5;
      poisonAttackCount--;
    } else {
      super.attack(hero);
    }
  }
}
