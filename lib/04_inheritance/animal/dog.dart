import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Dog extends Animal {
  String ordered;

  Dog(this.ordered);

  void listenOrder() {
    print('개가 $ordered를 따릅니다');
  }

  @override
  void makeSound() {
    print('개가 $sound하고 짖습니다');
  }

  @override
  String get sound => 'Bark';

  @override
  MoveType get type => MoveType.walking;
}
