import 'package:learn_dart_together/inheritance/animal/bird.dart';

import 'dog.dart';

class Animal {
  String type;
  String sound;

  Animal({required this.type, required this.sound});

  void soundCheck(){
    print('$type는 $sound 하고 운다');
  }
}

void main() {
   //Animal animal = Animal(type: "강아지", sound: "멍멍");
   Dog dog = Dog(type: '강아지', sound: '멍멍', breed: '비숑');
   dog.checkBreed();
   dog.soundCheck();

   Bird bird = Bird(type: '새', sound: "짹짹", canFly: true);
   bird.fly();
   bird.soundCheck();
}
