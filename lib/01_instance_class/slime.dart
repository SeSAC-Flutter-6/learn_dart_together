// 클래스
import 'package:learn_dart_together/01_instance_class/hero.dart';

class Slime {
  //static으로 공유자원으로 선언
  static final int level = 10;

  //멤버변수
  int hp;
  String suffix;

  //생성자
  Slime(
    this.hp,
    this.suffix,
  );

  void run() {
    print('슬라임 $suffix가 도망갔다!');
  }

  void attack(Hero hero) {
    print('슬라임 $suffix이/가 공격했다!');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

// 이 클래스를 이용해, 다음 사양을 따르는 PoisonSlime 클래스를 작성하시오
//  1.독 슬라임(PoisonSlime) 은, 슬라임 (Slime) 중에서도 특히 “독 공격" 이 되는 것
//  2.PoisonSlime 는 아래의 코드로 인스턴스화 되는 클래스임
//   PoisonSlime poisonSlime = PoisonSlime(‘A’);
//  3. PoisonSlime 독 공격이 가능한 남은 횟수를 int 형 필드를 가지고 있고 초기값은 5 이다
//  4. PoisonSlime attack() 메소드가 호출되면 다음 내용의 공격을 한다
//      a. 우선, “보통 슬라임과 같은 공격"을 한다
//      b.“독 공격의 남은 횟수"가 0이 아니면 다음을 추가로 수행한다
//      c.화면에 “추가로, 독 포자를 살포했다!” 를 표시
//      d.용사의 HP 의 1/5에 해당하는 포인트를 용사의 HP 로부터 감소시키고, “~포인트의 데미지" 라고 표시
//      e.“독 공격의 남은 횟수" 를 1 감소 시킨다
class PoisonSlime extends Slime {
  int poisonAttackCount = 5;//외부에서 수정이 가능할 수 있기때문에 안전하게 캡슐화 하는게 낫다

  PoisonSlime(
    super.hp,
    super.suffix,
  );

  @override
  void attack(Hero hero) {
    if (poisonAttackCount > 0) {

      //독 공격을 수행하면 횟수가 줄어든다
      poisonAttackCount -= 1;
      //독 공격을 수행하면 1/5로 hp가 줄어들고 변수에 담는다
      int poisonDamageHp = (hero.hp * 0.2.toInt());
      //독 공격을 받고 남은 hp를 변수에 담는다
      int remainHp = hero.hp - poisonDamageHp;

      print('추가로, 독 포자를 살포했다!');
      print('$poisonDamageHp 포인트의 데미지 용사의 남은 에너지는 $remainHp');
    }
  }


}

abstract class Monster {

}

void main() {
  Slime slimeA = Slime(50, '슬라임2');
  //Monster slimeB = Slime(30, '슬라임2');
}

