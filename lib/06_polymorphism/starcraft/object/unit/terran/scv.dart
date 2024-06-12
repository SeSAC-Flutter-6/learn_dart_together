import 'package:learn_dart_together/06_polymorphism/starcraft/tribe/terran.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/mechanic.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/attack_unit.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/magic_unit.dart';

import '../../../type/bionic.dart';
import '../../../type/unit_type/unit.dart';

final scvHp = 60;
final scvDamage = 5;

class Scv extends Terran implements AttackUnit, Bionic, Mechanic {
  int _hp;
  int _damage;

  Scv()
      : _hp = scvHp,
        _damage = scvDamage;

  @override
  int get hp => _hp;

  @override
  int get maxHp => scvHp;

  @override
  set hp(int value) {
    _hp = value;
  }

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

  void containMineral() {}

  void repair(Unit target) {
    if (identical(this, target)) {
      print('자가 치료는 불가합니다.');
      return;
    }

    if (target is! Mechanic) {
      print('수리가 불가능 합니다.');
      return;
    }

    target.hp += 1;
  }
}
