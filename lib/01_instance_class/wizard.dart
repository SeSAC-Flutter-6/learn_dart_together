import 'dart:math';
import 'package:learn_dart_together/01_instance_class/wand.dart';

class Wizard {
  String name;
  int _hp;
  int mp;
  Wand? wand;

  int get hp => _hp;
  set hp(int value) {
    _hp = max(0, value);
  }

  Wizard({
    required this.name,
    required int hp,
    required this.mp,
    required this.wand
  }) : _hp = hp {
    if (name.length < 3) {
      throw Exception('마법사의 이름은 3글자 이상이어야 합니다.');
    }

    if (wand == null) {
      throw Exception('마법사의 지팡이는 null 일 수 없습니다.');
    }

    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }

    if (_hp < 0) {
      _hp = 0;
    }
  }
}