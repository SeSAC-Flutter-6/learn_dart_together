import 'dart:math';
import 'package:learn_dart_together/03_encapsulation/wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand? _wand;

  static const minNameLength = 3;

  String get name => _name;
  set name(String value) {
    if (value.length < minNameLength) {
      throw Exception('마법사의 이름은 3글자 이상이어야 합니다.');
    }
    _name = value;
  }

  Wand? get wand => _wand;
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('마법사의 지팡이는 null로 설정될 수 없습니다.');
    }

    if (value.name.length < minNameLength) {
      throw Exception('마법사의 지팡이 이름은 3글자 이상이어야 합니다.');
    }
    _wand = value;
  }

  int get hp => _hp;
  set hp(int value) {
    _hp = max(0, value);
  }

  int get mp => _mp;
  set mp(int value) {
    if (value < 0) {
      throw Exception('마법사의 mp는 0이하로 설정될 수 없습니다.');
    }
    _mp = value;
  }

  Wizard({
    required String name,
    required int hp,
    required int mp,
    required Wand? wand
  }) : _name = name, _hp = hp, _mp = mp, _wand = wand {
    // 생성자에서 setter를 호출하여 validation
    this.name = name;
    this.hp = hp;
    this.mp = mp;
  }
}