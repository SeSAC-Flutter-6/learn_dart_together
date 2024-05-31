class Cleric {
  String name;
  int hp = 50;
  int mp = 10;

  final int maxHp = 50;
  final int maxMp = 10;

  Cleric({
    required this.name
  });

  void selfAid() {
    final int cost = 5;

    if (mp < cost) return;

    mp -= cost;
    hp = maxHp;
  }
}