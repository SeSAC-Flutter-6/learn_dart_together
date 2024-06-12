import 'constants.dart';
import 'slime.dart';
import 'hero.dart';

class PoisonSlime extends Slime {
  int _poisonAttackCount;
  int get poisonAttackCount => _poisonAttackCount;

  set poisonAttackCount(int value) {
    _poisonAttackCount = value;
  }

  PoisonSlime({
    required super.suffix,
    int poisonAttackCount = poisonMaxAttackCount,
  }) : _poisonAttackCount = poisonAttackCount;

  @override
  void attack(Hero hero) {
    if (_poisonAttackCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      print('${hero.hp ~/ 5}의 데미지');
      hero.hp -= hero.hp ~/ 5;
      _poisonAttackCount--;
    } else {
      super.attack(hero);
    }
  }
}
