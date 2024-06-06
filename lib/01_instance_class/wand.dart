// 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
// 마법사의 지팡이는 null 일 수 없다.
// 마법사의 MP는 0 이상이어야 한다.
// HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다. (에러 아님)

class Wand {
  String _name; //이름
  double _power; //마력

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power;

  // 지팡이의 반드시 3문자 이상이어야 한다

  String get name => _name;
  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이의 반드시 3문자 이상이어야 한다');
    }

    _name = value;
  }

  double get power => _power;
  set power(double value) {
    if (0.5 > value || value > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 한다.');
    }
    _power = value;
  }
}
