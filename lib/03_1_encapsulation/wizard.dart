import 'package:learn_dart_together/03_1_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  static const int minNameLength = 3;

  Wizard({required String name, required int hp, required int mp, Wand? wand})
      : _name = name,
        _hp = hp,
        _mp = mp,
        _wand = wand {
    //세터를 호출하여 생성자에서도 유효성 검사
    this.name = name;
    this.hp = hp;
    this.mp = mp;
    this.wand = wand;
  }

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;
  Wand? get wand => _wand;

  set name(String name) {
    if (name.length < 3) {
      throw Exception('마법사의 이름은 3문자 이상이어야 합니다');
    }
    _name = name;
  }

  set hp(int hp) {
    _hp = hp < 0 ? 0 : hp;
    print('hp는 음수가 될 수 없으므로 0으로 처리');
  }

  set mp(int mp) {
    if (mp < 0) {
      throw Exception('mp는 음수가 될 수 없습니다');
    }
    _mp = mp;
  }

  set wand(Wand? wand) {
    if (wand == null) {
      throw Exception('마법사는 지팡이를 항상 소지해야 합니다');
    }
    _wand = wand;
  }
}
