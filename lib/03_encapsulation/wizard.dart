import 'dart:math';

import 'package:learn_dart_together/03_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  final int minNameLenth = 3;

  String get name => _name;

  set name(String value) {
    if (value.length < minNameLenth) {
      throw Exception("이름은 $minNameLenth글자 이상이어야 합니다");
    }
    _name = value;
  }

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) value = 0;
    _hp = value;
  }

  int get mp => _mp;

  set mp(int value) {
    if (value < 0) throw Exception("mp는 항상 0 이상이어야 합니다.");
    _mp = value;
  }

  Wand? get wand => _wand;

  set wand(Wand? value) {
    if (value == null) throw Exception("지팡이를 null로 지정 할 수 없습니다.");
    _wand = value;
  }

  Wizard({required name, hp = 50, mp = 10, wand})
      : _name = name,
        _hp = max(hp, 0),
        _mp = mp,
        _wand = wand {
    if (name.length < minNameLenth) {
      throw Exception("이름은 $minNameLenth글자 이상이어야 합니다");
    }
    if (mp < 0) throw Exception("mp는 항상 0 이상이어야 합니다.");
  }
}
