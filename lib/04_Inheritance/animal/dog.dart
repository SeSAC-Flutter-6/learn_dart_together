
import 'package:learn_dart_together/04_Inheritance/animal/animal.dart';

class Dog extends Animal {

  Dog({
   required super.type,
   required super.sound
  });

  @override
  void say() {
    super.say();
    print('라고 강아지가 말했다.');
  }

  void sit() {
    print('강아지가 앉았다.');
  }
}