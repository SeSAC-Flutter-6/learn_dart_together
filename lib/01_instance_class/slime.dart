// 클래스
import 'package:learn_dart_together/01_instance_class/wizard.dart';

import 'hero.dart';

class Slime {
  final int level = 10;

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

  void attack(Wizard wizard) {
    print('슬라임 $suffix가 공격했다!');
    wizard.hp -= 10;
    if (wizard.hp <= 0) {
      wizard.die();
    }
  }
}
