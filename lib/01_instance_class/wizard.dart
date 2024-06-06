class Wand {
  String _name; //이름
  double _power; //마력

  Wand(String name, double power)
      : assert(power >= 0.5 && power <= 100.0 && name.length >= 3),
        _name = name,
        _power = power;

  String get name => _name;

  double get power => _power;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름이 너무 짧아요 3글자 이상 입력하세요');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception('마력은 0.5 이상 100.0 이하여야 합니다');
    }
    _power = value;
  }
}

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wizard(String name, int hp, int mp, Wand wand)
      : assert(name.length >= 3 && mp >= 0),
        _name = name,
        _hp = hp < 0 ? 0 : hp,
        // HP가 음수가 되는 상황에서는 대신 0을 설정
        _mp = mp,
        _wand = wand;

  String get name => _name;

  int get hp => _hp;

  int get mp => _mp;

  Wand? get wand1 => _wand;

  set name(String value) {
    if (value == null) {
      throw Exception('이름은 null이 아니어야 합니다');
    }
    _name = value;
  }

  set hp(int value) {
    _hp = value >= 0 ? value : 0; // 음수인 경우 0으로 설정
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다');
    }
    _mp = value;
  }

  set wand(Wand? value) {
    print(value == null);
    if (value == null) {
      throw Exception('마법사는 한 번 지팡이를 들면 내려놓을 수 없어요');
    }
    _wand = value;
  }
}
