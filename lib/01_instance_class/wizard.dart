import 'package:learn_dart_together/01_instance_class/wand.dart';

class Wizard {
  String name;
  int hp;
  int mp;
  Wand? wand;

  Wizard({
    required this.name,
    required this.hp,
    required this.mp,
    required this.wand
  }) {
    if (wand == null) {
      throw Exception('마법사의 지팡이는 null 일 수 없습니다.');
    }

    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다.');
    }

    if (hp < 0) {
      hp = 0;
    }
  }
}