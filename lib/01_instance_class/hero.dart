import 'package:learn_dart_together/01_instance_class/slime.dart';

void main() {
  Hero hero = Hero(name: '홍길동', hp: 100); //인스턴스 생성 : 힙이라는 메모리에 올라감
}

class Hero {
  // 클래스명은 대문자로 시작(pascal), 명사
  //field, 전역변수, 멤버변수, 프로퍼티 : 필드명은 명사로, camel case
  String _name;

  String get title => _name; // 내부적으로는 name을 쓰지만 외부적으로는 title을 쓸거야

  set name(String value) {
    if (value.isEmpty) {
      throw Exception('길이가 짧습니다.');
    }
    _name = value;
  }

  int hp;
  static int money = 100;

  //생성자
  Hero({required String name, required this.hp}) : _name = name;

  //메서드
  void attack(Slime slime) {
    // 메서드명은 동사, camel case
    //이름이 김씨면 파워가 +13
    //오씨면 +10
  }

  void run() {}

  void sleep() {
    hp = 100;
    print('$_name가 잤다.');
  }
}
//원래 파일하나당 하나의 클래스가 원칙
