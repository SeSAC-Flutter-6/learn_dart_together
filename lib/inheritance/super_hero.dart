import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp}){
    print('2. SuperHeor 생성자');
  }

  @override
  void run() {
    super.run(); // Hero run 호출
    // TODO: implement run
    print('2번 런');
    super.run();
  }
}

void main() {
  // final hero = Hero(name: 'name', hp: 100);
  final superHero = SuperHero(name: 'name', hp: 100);  // => 생성자가 먼저 생성됨

  // hero.run(); //1번 런
  // superHero.run(); //2번 런 1번 런을 무시
}
