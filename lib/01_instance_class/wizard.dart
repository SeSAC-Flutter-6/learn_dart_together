import 'dart:math';
import 'package:learn_dart_together/01_instance_class/wand.dart';

class Wizard {
  String name;
  int _hp;
  int _mp;
  Wand? _wand;

  Wand? get wand => _wand;
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('마법사의 지팡이는 null로 설정될 수 없습니다.');
    }

    if (value.name.length < 3) {
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
    required this.name,
    required int hp,
    required int mp,
    required Wand? wand
  }) : _hp = hp, _mp = mp, _wand = wand {
    if (name.length < 3) {
      throw Exception('마법사의 이름은 3글자 이상이어야 합니다.');
    }

    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }

    if (_hp < 0) {
      _hp = 0;
    }
  }
}