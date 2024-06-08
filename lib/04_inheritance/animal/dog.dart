import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Dog extends Animal {
  int teeth;

  Dog(super.type, super.sound, this.teeth);

  void run() {
    print('그리고 개가 달립니다.');
  }

  @override
  void crying() {
    super.crying();
    run();
  }
}
