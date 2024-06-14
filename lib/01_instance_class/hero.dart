import 'dart:math';

import 'package:learn_dart_together/01_instance_class/slime.dart';

void main() {
  Hero hero = Hero(name: '홍길동', hp: 100); //인스턴스 생성 : 힙이라는 메모리에 올라감
}

class Hero implements Comparable<Hero> {
  // 클래스명은 대문자로 시작(pascal), 명사
  //field, 전역변수, 멤버변수, 프로퍼티 : 필드명은 명사로, camel case
  int _hp;
  String _name;
  static int money = 100;

  String get title => _name; // 내부적으로는 name을 쓰지만 외부적으로는 title을 쓸거야

  int get hp => _hp;

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('길이가 짧습니다.');
    }
    _name = value;
  }

  set hp(int value) {
    _hp = max(0, value);
  }

  //생성자
  Hero({required String name, required int hp})
      : _name = name,
        _hp = hp;

  //메서드
  void attack(Slime slime) {
    // 메서드명은 동사, camel case
    //이름이 김씨면 파워가 +13
    //오씨면 +10
  }

  void run() {
    print('1번 run');
  }

  void sleep() {
    _hp = 100;
    print('$_name가 잤다.');
  }

  @override
  String toString() {
    return '내가 $_name이다.';
  }

  //generate 사용
  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Hero && runtimeType == other.runtimeType && _name == other._name;
  //
  // @override
  // int get hashCode => _name.hashCode;

  @override
  bool operator ==(Object other) {
    return other is Hero &&
        runtimeType == other.runtimeType &&
        _name == other._name;
  }

  @override
  int get hashCode => _name.hashCode;

  @override
  int compareTo(Hero other) {
    return _name.compareTo(other._name); // _name이라고 해야하나 title 이라고 해야하나
  } //스트링은 항상 동일한 해시값이 나온다.
}
//원래 파일하나당 하나의 클래스가 원칙
