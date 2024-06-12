import 'package:learn_dart_together/06_polymorphism/starcraft/tribe/protoss.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/attack_unit.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/mechanic.dart';

import '../../../type/unit_type/unit.dart';

final dragunHp = 150;
final dragunShield = 100;
final dragunDamage = 20;

class Dragun extends Protoss implements AttackUnit, Mechanic {
  int _hp;
  int _shield;
  int _damage;

  Dragun()
      : _hp = dragunHp,
        _shield = dragunShield,
        _damage = dragunDamage;

  @override
  int get hp => _hp;

  @override
  set hp(int value) {
    _hp = value;
  }

  @override
  int get maxHp => dragunHp;

  @override
  int get shield => _shield;

  @override
  set shield(int value) {
    _shield = value;
  }

  @override
  int get maxShield => dragunShield;

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
    shield += 1;
  }
}
