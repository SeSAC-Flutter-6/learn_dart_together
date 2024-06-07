import 'wand.dart';

class Wizard {
  String name;
  int hp;
  int mp;
  Wand? _wand;

  final int minNameLength = 2;
  final int minMp = 0;
  final int defaultHp = 0;

  Wand? get wand => _wand;

  Wizard({
    required this.name,
    required this.hp,
    required this.mp,
    required wand,
  }) {
    if (name.length <= minNameLength) throw Exception('마법사 name을 3글자 이상으로 정해주세요');
    if (mp < minMp) throw Exception('MP는 $minMp이상이어야 합니다');
    if (hp.isNegative) hp = defaultHp;
  }
}
