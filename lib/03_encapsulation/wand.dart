class Wand {
  String _name;
  double _power;

  String get name => _name;

  double get power => _power;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5 || value > 100.0) {
      throw Exception('마력은 0.5이상, 100이하 여야 합니다.');
    }
    _power = value;
  }

  Wand({required String name, required double power})
      : _power = power,
        _name = name {
    if (power < 0.5 || power > 100) {
      throw Exception('마력은 0.5이상, 100이하 여야 합니다.');
    }
    if (name.length < 3) {
      throw Exception('이름은 3글자 이상이어야 합니다.');
    }
  }
}
