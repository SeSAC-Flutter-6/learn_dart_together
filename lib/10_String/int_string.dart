import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  int luckyNumber1 = 13;
  int luckyNumber2 = luckyNumber1;
  luckyNumber2 = 12;

  print(luckyNumber1);
  print(luckyNumber2);

  String luckyString3 = '13';
  String luckyString4 = luckyString3;
  luckyString4 = '12';

  print(luckyString3);
  print(luckyString4);

  Hero hero1 = Hero(name: 'name', hp: 100);
  Hero hero2 = hero1;
  hero2 = Hero(name: '이름', hp: 1);

  print(hero1);
  print(hero2);
}
