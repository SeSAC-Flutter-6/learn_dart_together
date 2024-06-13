// void main() {
//   //ctrl+h -> 안드로이드 스튜디오에서 상속 받은 것을 확인할 수 있다.
//   String string = 'hello';

//   Object object = '111';
//   object = 11;
//   object = Hero(); //다형성 때문에, Object는 모든 클래스를 상속 받고 있다.

//   Hero hero1 = Hero(name: 'name', hp: 100);
//   Hero hero2 = Hero(name: 'name', hp: 100);

//   print(hero1 == hero2);
// }

// class Hero extends Object {}

import 'package:learn_dart_together/01_instance_class/collection.dart';

Person person1 = Person(name: 'Jack', age: 23);
Person person2 = person1;

void main() {
  print(person1 == person2); //true
}
