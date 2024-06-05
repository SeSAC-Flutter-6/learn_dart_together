class Wand {
  String name;
  double power;

  Wand({
    required this.name,
    required this.power
  }) {
    if (name.length < 3) {
      throw Exception('지팡이의 이름은 3글자 이상이어야 합니다.');
    }
    if (power > 100 || power < 0.5) {
      throw Exception('지팡이의 마력은 0.5 이상 100.0 이하여야 합니다.');
    }
  }
}