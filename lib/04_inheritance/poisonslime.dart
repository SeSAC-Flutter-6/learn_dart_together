import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

class PoisonSlime extends Slime {
  int _poisonAttackLeft;

  int get poisonAttackLeft => _poisonAttackLeft;

  PoisonSlime(super.suffix, {int poisonAttackLeft = 5})
      : _poisonAttackLeft = poisonAttackLeft;

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_poisonAttackLeft > 0) {
      _poisonAttackLeft -= 1;
      final int damage = hero.hp ~/ 5;
      hero.hp -= damage;

      print('추가로 독 포자를 살포했다!');
      print('$damage의 데미지');
    }
  }
}
