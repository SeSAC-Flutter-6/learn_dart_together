class Slime extends Monster {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  @override
  void run() {
    print('슬라임 도망침');
  }

  void attack() {
    print('공격');
  }
}

abstract class Monster {
  void run() {
    print('monster');
  }
}

void main() {
  Slime slime = Slime('A');
  Monster monster = Slime('B');
  Monster newMonster = slime;

  // 결과는 모두 slime의 run이 실행된다.
  slime.run();
  monster.run();

  // newMonster는 attack을 모른다.
  slime.attack();
  // newMonster.attack();
}