class Wand {
  String _name;
  double _power;

  String get name => _name;
  set name(String value) {
    if (value.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야 합니다.');
    }
    _name = value;
  }

  double get power => _power;
  set power(double value) {
    if (power > 100 || power < 0.5) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
    _power = power;
  }

  Wand({
    required String name,
    required double power
  }) : _name = name, _power = power {
    if (name.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야 합니다.');
    }
    if (power > 100 || power < 0.5) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
  }
}