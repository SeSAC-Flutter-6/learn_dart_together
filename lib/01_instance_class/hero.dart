import 'package:learn_dart_together/01_instance_class/slime.dart';

class Hero {
  // static 공통 머니 - 개인것이 아님 / 메모리 영역이 달라서
  // 접근이 안됨
  // top레벨에 변수를 만들어도 사용되지 않으면 메모리에 안올라가니까 조금이라도 빠르지만
  // 실제로 너무 많이 사용되면 정신이 없다
  // static과 일반 멤버변수는 서로 같은 공간에 있어도 서로 보이지 않는다고 봐야한다
  static int money = 100;

  //멤버변수
  String _name;
  int _hp;
  Sword? sword;

  //생성자
  Hero({
    required String name,
    required int hp,
    this.sword,
  }) : _hp = hp, _name = name;

  //게터 추가
  int get hp => _hp;
  String get name => _name;

  //setter에서 값의 타당성을 검사
  set name(String value) {
    if (value.length < 1) {
      throw Exception('이름이 너무 짧습니다.');
    }

    if (value.length > 8) {
      throw Exception('이름이 너무 깁니다');
    }

    _name = value;
  }
//데미지를 받으면 수정되는 setter
  set hp (int value) {

    if(value <= 0) {
      throw Exception('캐릭터가 사망했습니다.');
    }
    _hp = value;
  }

  //메서드
  //공격하기
  void attack(Slime slime) {
    print('$name이 $slime을 공격했다');
    print('슬라임의 반격을 받았다');
    _hp -= 10;
    if (_hp < 0) {
      _die();
    }
  }

  //도망가기
  void run() {
    print('$name은 도망쳤다');
  }

  //잠자기
  void sleep() {
    _hp = 100;
    print('$name은 잠을 자고 회복했다');
  }

  //미끄러짐
  void slip() {
    print('$name은 미끄러졌다!');
  }

  //앉기
  void sit(int sec) {
    print('$name은 $sec초동안 앉아 있었다');
  }

  //검공격
  void SwordAttack() {
    print('공격했습니다.');
  }

  //

  void _die() {
    print('죽었습니다.');
  }

  void bye() {
    print('안녕히가세요');
  }
}

class Sword {
  String name;
  int damage;

  Sword({
    required this.name,
    required this.damage,
  });
}


