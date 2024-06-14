import 'dart:math';
import 'slime.dart';

class Hero implements Comparable<Hero> {
  String name;
  int _hp;

  int get hp => _hp;
  set hp(int value) {
    _hp = max(0, value);
  }

  Hero({
    required this.name,
    required int hp,
  }) : _hp = hp {
    this.hp = hp;
  }

  void attack(Slime slime) {
    print('$name이 $slime을 공격했다!');
    slime.hp -= 10;
  }

  void run() {
    print('1번 run');
  }

  void sleep() {
    hp = 100;
  }

  @override
  String toString() {
    // 자주 쓰니까 generator 쓰기
    // return super.toString(); <- 호출 안해도 됨
    return '내 이름은 $name이다';
  }

  @override
  bool operator ==(Object other) {
    return other is Hero &&
        runtimeType == other.runtimeType &&
        name == other.name;
  }

  @override
  int compareTo(Hero other) {
    return name.compareTo(other.name); // 순서 거꾸로 하려면 (-) 붙이기
  }

  @override
  int get hashCode => name.hashCode;
}
