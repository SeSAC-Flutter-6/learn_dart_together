abstract class Character {
  void attack();

  void run() => print('달린다');
}

class Monster extends Character {
  @override
  void attack() => print('공격시작');

}

class Goblin extends Monster {
  @override
  void attack() {
    // TODO: implement attack
  }

  @override
  void run() {
    // TODO: implement run
  }
}
