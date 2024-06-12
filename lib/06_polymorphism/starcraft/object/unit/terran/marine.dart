import 'package:learn_dart_together/06_polymorphism/starcraft/tribe/terran.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/attack_unit.dart';

import '../../../type/bionic.dart';
import '../../../type/unit_type/unit.dart';


final marineHp = 40;
final marineDamage = 6;

class Marine extends Terran implements AttackUnit, Bionic {
  int _hp;
  int _damage;

  Marine()
      : _hp = marineHp,
        _damage = marineDamage;

  @override
  int get hp => _hp;

  @override
  set hp(int value) {
    _hp = value;
  }

  @override
  int get maxHp => marineHp;

  @override
  int get damage => _damage;

  @override
  set damage(int value) {
    _damage = value;
  }

  @override
  void attack(Unit target) {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }
}
