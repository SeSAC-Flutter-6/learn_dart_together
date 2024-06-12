void main() {
  Slime slime = Slime('A');
  Monster monster = Slime('B');

  slime.run();
  monster.run();
}

abstract class Monster {
  void run() {
    print('뚜벅뚜벅');
  }
}

class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임$suffix이/가 도망친다');
  }
}
