import 'wand.dart';

class Wizard {
  String? _name;
  int _hp;
  int _mp;
  Wand? wand;

  String? get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  Wizard(String name, int hp, int mp, this.wand)
      : _name = name,
        _hp = hp,
        _mp = mp;

  set name(String? value) {
    if (value == null) {
      throw Exception('이름이 null 입니다');
    }
    if (value.length < 3) {
      throw Exception('이름이 3문자 미만입니다');
    }
    _name = value;
  }

  set mp(int value) {
    if (mp < 0) {
      throw Exception('마나가 0 이하입니다');
    }

    _mp = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('체력이 0 이하입니다');
    }

    _hp = value;
  }
}
