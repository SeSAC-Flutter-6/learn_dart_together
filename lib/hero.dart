import 'package:learn_dart_together/slime.dart';

void main() {
  Hero hero = Hero(name: '홍길동', hp: 100); //인스턴스 생성 : 힙이라는 메모리에 올라감

}

class Hero {
  // 클래스명은 대문자로 시작(pascal), 명사
  //field, 전역변수, 멤버변수, 프로퍼티 : 필드명은 명사로, camel case
  String name;
  int hp;

  //생성자
  Hero({required this.name, required this.hp});

  //메서드
  void attack(Slime slime) {
    // 메서드명은 동사, camel case
    //이름이 김씨면 파워가 +13
    //오씨면 +10
  }

  void run() {}

  void sleep() {
    hp = 100;
    print('$name 이 잔다.');
  }
}
//원래 파일하나당 하나의 클래스가 원칙
