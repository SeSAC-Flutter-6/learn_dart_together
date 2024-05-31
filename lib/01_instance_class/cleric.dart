//클레릭 클래스 생성
class Cleric {
  //멤버변수
  String name;
  int hp;
  int mp;

  //생성자
  Cleric(
    this.name,
    this.hp,
    this.mp,
  );

  //메서드 기능 -> 회복
  void resque() {
    print('$name이 회복기능을 사용했습니다.');
  }
}
