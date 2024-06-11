import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({required super.name, required super.hp});

  @override
  void run() {
    print('날아서 도망갔다.');
  }
}

void main(){
  final hero = Hero(name: '슈퍼맨', hp: 50);
  final superHero = SuperHero(name: '배트맨', hp: 100);

  hero.run();
  superHero.run();
}
