// 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다.
// 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.

class Wand {
  String _name;
  double _power;

  String get name => _name;
  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이의 이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }

  double get power => _power;
  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    _power = value;
  }

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power {
    this.name = name;
    this.power = power;
  }
}
