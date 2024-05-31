// 클래스
class Slime {

  final int level = 10;

  //멤버변수
  int hp;
  String suffix;

  //생성자
  Slime(this.hp, this.suffix);

  void run() {
    print('슬라임 $suffix가 도망갔다!');
  }
}