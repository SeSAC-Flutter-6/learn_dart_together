// import 'hero.dart';
import 'package:learn_dart_together/240605/wizard.dart';

import 'wand.dart';

void main() {
  // Hero h = Hero('홍길동     sdasdasda', 50);
  // h.name = '홍길동asdfasdfasdfa';
  // print(h.name);

  Wizard wizard =
      Wizard(name: "홍길동", hp: -1, mp: 0, wand: Wand(name: "나무", power: 100));

  print(wizard.wand?.name);
  print(wizard.hp);
  // wizard.wand = null;
  // print(wand.power);
}
