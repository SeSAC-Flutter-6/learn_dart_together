class Hero {
  // static 공통 머니 - 개인것이 아님 / 메모리 영역이 달라서
  // 접근이 안됨
  // top레벨에 변수를 만들어도 사용되지 않으면 메모리에 안올라가니까 조금이라도 빠르지만
  // 실제로 너무 많이 사용되면 정신이 없다
  // static과 일반 멤버변수는 서로 같은 공간에 있어도 서로 보이지 않는다고 봐야한다
  static int money = 100;

  //멤버변수
  String name = '';
  int hp = 0;
  Sword? sword;

  //생성자
  Hero({
    required String name,
    required int hp,
    this.sword,
  });

  //메서드
  //공격하기
  void attack() {
    print('$name은 공격했다');
  }

  //도망가기
  void run() {
    print('$name은 도망쳤다');
  }

  //잠자기
  void sleep() {
    hp = 100;
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

  //공격
  void SwordAttack() {
    print('공격했습니다.');
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
