abstract class Character {
  void attack();

  void run();
}

abstract class Monster extends Character {
  //void run();
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
