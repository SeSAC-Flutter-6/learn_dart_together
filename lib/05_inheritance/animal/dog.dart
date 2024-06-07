import 'package:learn_dart_together/05_inheritance/animal/animal.dart';

class Dog extends Animal {
  Dog({required super.type, required super.sound});

  void dig() {
    print('구덩이를 팝니다.');
  }
}
