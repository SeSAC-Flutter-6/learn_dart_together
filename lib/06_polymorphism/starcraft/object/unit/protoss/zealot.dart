import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/attack_unit.dart';

import '../../../tribe/protoss.dart';
import '../../../type/bionic.dart';
import '../../../type/unit_type/unit.dart';

final zelotShield = 50;
final zelotHp = 100;
final zelotDamage = 16;

class Zealot extends Protoss implements AttackUnit, Bionic {
  int _shield;
  int _hp;
  int _damage;

  Zealot()
      : _shield = zelotShield,
        _hp = zelotHp,
        _damage = zelotDamage;

  @override
  int get hp => _hp;

  @override
  set hp(int value) {
    _hp = value;
  }

  @override
  int get maxHp => zelotHp;

  @override
  int get shield => _shield;

  @override
  int get maxShield => zelotShield;

  @override
  set shield(int value) {
    _shield = value;
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

  @override
  void chargeShield() {
    // 주기적으로 쉴드 회복...
    shield += 1;
  }
}
