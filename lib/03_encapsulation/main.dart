import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/03_encapsulation/Person.dart';

import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:learn_dart_together/03_encapsulation/wizard.dart';

void main() {
  Hero.money = 200;
  Hero hero = Hero(name: '홍길동', hp: 100);
  Wand wand = Wand(name: '지팡이', power: 10);
  Wizard wizard = Wizard(name: '마법사', hp: -5, mp: -9, wand: wand);
  Person person = Person(name: '홍길동', birthYear: 1980);

  // wizard.name = '론';
  // wand.name = '활';
  // wand.power = 0;
  // wizard.mp = -5;
  // wizard.hp = -100;
  // print(wizard.hp);

  print(person.age);
}
