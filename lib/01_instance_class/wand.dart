class Wand {
  String _name = ''; //이름
  double _power = 0; //마력


  String get name => _name;
  double get power => _power;

//construtor에 조건을 걸어서 Exception을 만듦
  Wand({
    required String name,
    required double power,
  })
      : _name = name,
        _power = power {
    if (name.length < 3) {
      throw Exception('지팡이 이름은 3글자 이상이어야 합니다.');
    }

    if (name.isEmpty) {
      throw Exception('지팡이 이름은 꼭 있어야합니다.');
    }

    if (power <= 0 ) {
      throw Exception('마력은 0 이상이어야 합니다');
    }

    if (name.isEmpty) {
      throw Exception('마력은 꼭 있어야합니다.');
    }
  }
  //setter를 이용해 수정시에도 체크를 할 수 있다
  set name(String value) {
    if (name.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야 합니다.');
    }

    if (name.isEmpty) {
      throw Exception('지팡이의 이름은 꼭 있어야합니다.');
    }
  _name = value;
  }

  set power(double value) {
    if (0.5 < power || power <= 100 ) {
      throw Exception('마력은 0.5 이상 혹은 100 이하가 되야합니다');
    }

    if (name.isEmpty) {
      throw Exception('마력은 꼭 있어야합니다.');
    }
    _power = value;
  }
}