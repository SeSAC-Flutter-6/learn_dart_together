// 마법사의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// 마법사 생성 이후에 마법사의 지팡이에 null을 설정할 수 없다.
// (마법사는 한번 지팡이를 들면 내려놓을 수 없음)
// 마법사의 MP는 0 이상이어야 한다.
// HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

import 'package:learn_dart_together/03_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  String get name => _name;
  set name(String value) {
    if (value.length < 3) {
      throw Exception('마법사의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  int get hp => _hp;
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      print('hp에 0을 할당합니다.');
    } else {
      _hp = value;
    }
  }

  int get mp => _mp;
  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 mp는 0 이상이어야 합니다.');
    }
    _mp = value;
  }

  Wand? get wand => _wand;
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('마법사는 반드시 지팡이를 가져야합니다.');
    }
    _wand = value;
  }

  Wizard({
    required String name,
    required int hp,
    required int mp,
    Wand? wand,
  })  : _name = name,
        _hp = hp,
        _mp = mp,
        _wand = wand {
    this.name = name;
    this.hp = hp;
    this.mp = mp;
  }
}
