class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);
}

abstract class Monster {
  void run() {
    print('뚜벅뚜벅');
  }
}
