class Wand {
  String? _name;
  double _power;

  String? get name => _name;
  double get power => _power;

  Wand({
    String? name,
    required double power,
  })  : _name = name,
        _power = power {
    if (name == null) {
      throw Exception('생성자 에러: 이름이 null 입니다');
    }
    if (name.length < 2) {
      throw Exception('생성자 에러: 이름이 3문자 미만입니다');
    }
    if (power < 0.5) {
      throw Exception('생성자 에러: 마력이 0.5 미만입니다');
    }
    if (power > 100) {
      throw Exception('생성자 에러: 마력이 100 초과입니다');
    }
  }

  set name(String? value) {
    if (value == null) {
      throw Exception('이름이 null 입니다');
    }
    if (value.length < 2) {
      throw Exception('이름이 3문자 미만입니다');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5) {
      throw Exception('마력이 0.5 미만입니다');
    }
    if (value > 100) {
      throw Exception('마력이 100 초과입니다');
    }
    _power = value;
  }

  // {
  //   if (name.length < 3) {
  //     throw Exception('마법봉 이름이 너무 짧습니다.');
  //   }
  //   if (power < 0.5) {
  //     throw Exception('마법봉의 마력이 너무 낮습니다.');
  //   }
  //   if (power > 100) {
  //     throw Exception('마법봉의 마력이 너무 높습니다.');
  //   }
  // }
}
