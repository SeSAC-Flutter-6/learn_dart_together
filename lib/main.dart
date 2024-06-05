import 'package:learn_dart_together/cleric.dart';

import 'package:learn_dart_together/person.dart';
import 'package:learn_dart_together/wand.dart';
import 'package:learn_dart_together/wizard.dart';

void main() {
  /*Cleric cleric = Cleric(name: "성직자", hp: 40, mp: 10);
  cleric.selfAid();
  cleric.pray(3);*/

  Wand wand = Wand(name: "완드1", power: 100.0);
  //Wand noNameWand = Wand(power: 100.0); //에러
  Wizard wizard = Wizard(name: '세자', hp: 10, mp: 10, wand: null);
  //wizard.wand = wand; // 에러

  Person person = Person(name: '홍길동', birthYear: 1992);
  print(person.age);

}
