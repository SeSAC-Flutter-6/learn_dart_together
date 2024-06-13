import 'package:learn_dart_together/01_instance_class/slime.dart';
import '../01_instance_class/hero.dart';

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix, {required super.hp});

  int _remains = 5;

  int get remains => _remains;

  set remains(int value) {
    _remains = value;
  }

  @override
  void attack(Hero hero) {
    // TODO: implement attack
    super.attack(hero);
    if (_remains > 0) {
      print('추가로, 독 포자를 살포했다!');
      int damage = hero.hp ~/ 5;
      print('${damage + 10} 포인트의 데미지');
      hero.hp -= damage;
      _remains -= 1;
    }
  }
}
