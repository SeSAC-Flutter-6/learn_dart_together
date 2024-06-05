import 'dart:math';

import 'package:learn_dart_together/03_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _mp;
  int _hp;
  Wand wand;

  String get name => _name;

  int get mp => _mp;

  int get hp => _hp;

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
    }
  }

  Wizard(
      {required String name,
      required int mp,
      required int hp,
      required this.wand})
      : _mp = max(mp, 0),
        _hp = max(hp, 0),
        _name = name;
}
