import 'package:learn_dart_together/04_inheritance/animal/animal.dart';

class Bird extends Animal {
  double wingSpan;

  Bird(this.wingSpan);

  void showWingSpan() {
    print('새의 날개는 $wingSpan cm 입니다.');
  }

  @override
  void makeSound() {
    print('새가 $sound하고 지저귑니다.');
  }

  @override
  String get sound => 'Tweet';

  @override
  MoveType get type => MoveType.flying;
}
