// // 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// // 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
// // 마법사의 지팡이는 null 일 수 없다.
// // 마법사의 MP는 0 이상이어야 한다.
// // HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)

import 'package:learn_dart_together/01_instance_class/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand _wand;

  Wizard(
      {required String name,
      required int hp,
      required int mp,
      required Wand wand})
      : _name = name,
        _hp = hp >= 0 ? hp : 0,
        _mp = mp >= 0 ? mp : 0,
        _wand = wand;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('마법사 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다');
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      throw Exception('HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다.');
    }
    _hp = value;
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('MP는 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  set wand(Wand value) {
    if (value == null) {
      throw Exception('마법사의 지팡이는 null 일 수 없습니다.');
    }
    _wand = value;
  }
}
