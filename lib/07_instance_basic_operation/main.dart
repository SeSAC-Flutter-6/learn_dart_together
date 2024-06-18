import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String string = 'hello';

  Object object = '111';

  Hero hero1 = Hero(name: '홍길동', hp: 100);
  Hero hero2 = Hero(name: 'name', hp: 100);

  print(hero1 == hero2);

  print(hero1);
}

class AAA extends Object {

}