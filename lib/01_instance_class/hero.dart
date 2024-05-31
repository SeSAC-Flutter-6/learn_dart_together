class Hero {
  //멤버변수
  String name;
  int hp;

  //생성자
  Hero(this.name, this.hp);

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
}