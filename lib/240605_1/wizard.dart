import 'wand.dart';

class Wizard {
  String? _name;
  int _hp;
  int _mp;
  Wand? _wand;

  String? get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  Wizard({String? name, required int hp, required int mp, Wand? wand})
      : _name = name,
        _hp = hp,
        // _hp = hp < 0 ? 0 : hp,
        _mp = mp {
    if (name == null) {
      throw Exception('생성자 에러: 이름이 null 입니다');
    }
    if (name.length < 3) {
      throw Exception('이름이 3문자 미만입니다');
    }
    if (hp < 0) {
      _hp = 0;
      // throw Exception('체력이 0 미만입니다 (hp는 0으로 설정됩니다)');
    }
    if (mp < 0) {
      throw Exception('마나가 0 미만입니다');
    }
  }

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
    if (value < 0) {
      throw Exception('마나가 0 미만입니다');
    }

    _mp = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      // throw Exception('체력이 0 미만입니다 (hp는 0으로 설정됩니다)');
    } else {
      _hp = value;
    }
  }

  set wand(Wand? value) {
    if (value == null) {
      throw Exception('지팡이가 null 입니다. (한번 지팡이를 들면 내려놓을 수 없습니다)');
    }
    _wand = value;
  }
}
