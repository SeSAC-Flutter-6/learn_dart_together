class Character {}

class Hero extends Character {
  String name;
  int hp;

  Hero({
    required this.name,
    required this.hp,
  });

  @override
  String toString() {
    return 'Hero{name: $name, hp: $hp}';
  }

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Hero &&
  //         runtimeType == other.runtimeType &&
  //         name == other.name &&
  //         hp == other.hp;

  @override
  int get hashCode => name.hashCode ^ hp.hashCode;
}

void main() {
  Hero hero = Hero(name: '홍길동', hp: 100);
  Character hero2 = Hero(name: '홍길동', hp: 100);

  print(hero.hashCode);
  print(hero2.hashCode);
  print(hero == hero2);
}
