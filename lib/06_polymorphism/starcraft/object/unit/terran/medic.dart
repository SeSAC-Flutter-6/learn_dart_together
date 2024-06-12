import 'package:learn_dart_together/06_polymorphism/starcraft/tribe/terran.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/type/unit_type/magic_unit.dart';

import '../../../type/bionic.dart';
import '../../../type/unit_type/unit.dart';

final medicHp = 40;
final medicMp = 250;

class Medic extends Terran implements MagicUnit, Bionic {
  int _hp;
  int _mp;

  Medic()
      : _hp = medicHp,
        _mp = medicMp;

  @override
  int get hp => _hp;

  @override
  set hp(int value) {
    _hp = value;
  }

  @override
  int get mp => _mp;

  @override
  set mp(int value) {
    _mp = value;
  }

  @override
  // TODO: implement maxHp
  int get maxHp => medicHp;

  @override
  // TODO: implement maxMp
  int get maxMp => medicMp;

  @override
  void move() {
    // TODO: implement move
  }

  void heal(Unit target) {
    if (target is! Bionic) {
      print('${target.toString()}은 힐 불가');
      return;
    }

    target.hp += 1;
  }

  @override
  void useMagic({Unit? target}) {
    if (target != null) {
      heal(target);
    }
  }
}
