import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Cat extends Animal {
  int teeth;

  Cat(super.type, super.sound, this.teeth);

  void run() {
    print('그리고 고양이가 달립니다.');
  }

  @override
  void crying() {
    super.crying();
    run();
  }
}
