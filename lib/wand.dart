class Wand {
  String name;
  double power; // 마력

  final int minNameLength = 2;
  final double minPower = 0.5;
  final double maxPower = 100.0;

  Wand({required this.name, required this.power}) {
    if (name.length <= minNameLength) throw Exception('지팡이 name을 3글자 이상으로 정해주세요');
    if (power > maxPower || power < minPower) throw Exception('지팡이의 마력은 $minPower 이상 $maxPower 이하여야 한다.');
  }
}
