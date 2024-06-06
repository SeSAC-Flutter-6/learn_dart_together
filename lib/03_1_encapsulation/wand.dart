class Wand {
  String _name;
  double _power;

  Wand({
    required String name,
    required double power,
  })  : _name = name,
        _power = power {
    //세터를 호출하여 생성자에서도 유효성 검사
    this.name = name;
    this.power = power;
  }

  String get name => _name;
  double get power => _power;

  set name(String name) {
    if (name.length < 3) {
      throw Exception('지팡이의 이름은 3문자 이상이어야 합니다');
    }
    _name = name;
  }

  set power(double power) {
    if (power > 100.0 || power < 0.5) {
      throw Exception('지팡이의 마력 범위는 0.5이상, 100.0이하입니다');
    }
    _power = power;
  }
}
