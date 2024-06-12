import 'package:learn_dart_together/06_polymorphism/starcraft/tribe/zerg.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/attack_unit.dart';

import '../../../type/bionic.dart';
import '../../../type/unit_type/unit.dart';

final zerglingHp = 40;
final zerglingDamage = 5;

class Zergling extends Zerg implements AttackUnit, Bionic {
  int _hp;
  int _damage;

  Zergling()
      : _hp = zerglingHp,
        _damage = zerglingDamage;

  @override
  int get hp => _hp;

  @override
  set hp(int value) {
    _hp = value;
  }

  @override
  int get maxHp => zerglingHp;

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

  @override
  void selfAid() {
    // 주기적으로 hp 회복...
    hp += 1;
  }
}
