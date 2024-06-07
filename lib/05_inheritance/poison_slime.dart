import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/05_inheritance/slime.dart';

class PoisonSlime extends Slime {
  int attackCount = 5;
  int plusDamage = 0;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    plusDamage = 0;
    if (attackCount > 0) {
      print('추가로, 독 포자를 살포했다.!');
      plusDamage = hero.hp ~/ 5;
      hero.hp -= plusDamage;
      print('$plusDamage 포인트의 데미지');
      attackCount -= 1;
    }
  }

  void main() {
    Hero hero = Hero(name: '슈퍼맨', hp: 100);
    PoisonSlime poisonSlime = PoisonSlime('A');
    poisonSlime.attack(hero);
  }
}
