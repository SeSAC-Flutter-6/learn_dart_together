import 'dart:math';

import 'package:learn_dart_together/03_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _mp;
  int _hp;
  Wand? _wand;

  String get name => _name;

  int get mp => _mp;

  int get hp => _hp;

  Wand? get wand => _wand;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
    _name = value;
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0보다 작을 수 없습니다.');
    }
    _mp = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이를 놓지 마세요.');
    }
    _wand = value;
  }

  Wizard({required String name, required int mp, required int hp, Wand? wand})
      : _name = name,
        _mp = mp,
        _hp = max(hp, 0),
        _wand = wand {
    if (name.length < 3) {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
    if (mp < 0) {
      throw Exception('mp는 0보다 작을 수 없습니다.');
    }
  }
}
