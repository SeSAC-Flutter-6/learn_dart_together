import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Person {
  String name;
  int age;
  Animal? pet;

  Person({
    required this.name,
    required this.age,
    this.pet,
  });

  void sayHello() {
    print('인사하기');
  }

  void feed() {
    print('밥주기');
  }
}
