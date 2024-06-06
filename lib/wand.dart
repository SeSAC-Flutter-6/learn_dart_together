class Wand {
  String _name;
  double _power;

  final int minNameLenth = 3;
  final double minPower = 0.5;
  final double maxPower = 100;

  String get name => _name;

  set name(String value) {
    if (value.length < minNameLenth) {
      throw Exception("이름은 $minNameLenth글자 이상이어야 합니다");
    }
    _name = value;
  }

  double get power => _power;

  set power(double value) {
    if (value < minPower || value > maxPower) {
      throw Exception("지팡이의 마력은 $minPower 이상 $maxPower 이하여야 합니다.");
    }
    _power = value;
  }

  Wand({required String name, required double power})
      : _name = name,
        _power = power {
    if (name.length < minNameLenth) {
      throw Exception("이름은 $minNameLenth글자 이상이어야 합니다");
    }

    if (power < minPower || power > maxPower) {
      throw Exception("지팡이의 마력은 $minPower 이상 $maxPower 이하여야 합니다.");
    }
  }
}
