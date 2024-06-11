import 'constants.dart';
import 'hero.dart';

class Slime {
  int hp = slimeMaxHealth;
  final String suffix;

  Slime({required this.suffix});

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다!');
    print('10의 데미지');
    hero.hp -= 10;
  }
}
