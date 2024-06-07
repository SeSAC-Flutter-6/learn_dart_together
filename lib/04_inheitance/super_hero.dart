import 'package:learn_dart_together/01_instance_class/hero.dart';

class SuperHero extends Hero {
  SuperHero({
    required super.name,
    required super.hp,
  });



  @override
  void run() {
    print('2번 run');
  }
}
