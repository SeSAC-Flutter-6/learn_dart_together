import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Bird extends Animal {
  bool isMigratory;

  Bird({
    required super.sound,
    required super.type,
    required this.isMigratory,
  });

  @override
  void talk() {
    print('$sound 노래부르기');
  }

  void fly() {
    print('날기');
  }
}
