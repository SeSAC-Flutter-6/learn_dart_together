//1. PoisonSlime이라는 클래스를 만들고, slime 상속받기
//2. final String suffix 부분을 super로 받고,
//3. PoisonAttack을 5번으로 하고
//4. 보통 슬라임과 같은 공격+ 독 공격 횟수가 0이 아니면 -> 추가하기
//4.2 print('추가로 독 포자를 살포했다!') 표시하기
//5. hero.hp 부분에서, HP의 1/5 부분을 감소시키고
//5.2 ~포인트의 데미지라고 표시하고
//.6. 독 공격의 남은 횟수를 1 감소 -> poisonAttack = poisonAttack -1로 표시하면 될듯함

import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/240607_inheritance/slime.dart';

void main() {}

class PoisonSlime extends Slime {
  int poisonAttack = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (poisonAttack > 0) {
      print('추가로, 독 포자를 살포했다');
      int poisonDamage =
          (hero.hp / 5).toInt(); //반올림 되는 것 같다. 625.6이 나오는데, 626으로 반환됨
      hero.hp = hero.hp - poisonDamage;
      print('$poisonDamage 포인트의 데미지');
      poisonAttack--;
    }
  }
}
