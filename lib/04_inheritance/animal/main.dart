import 'package:learn_dart_together/04_inheritance/animal/animal.dart';
import 'package:learn_dart_together/04_inheritance/animal/bird.dart';
import 'package:learn_dart_together/04_inheritance/animal/cat.dart';
import 'package:learn_dart_together/04_inheritance/animal/dog.dart';

void main() {
  Animal dog = Dog('개', '멍멍', 42);
  Animal cat = Cat('고양이', '냐옹', 30);
  Animal bird = Bird('참새', '짹짹', true);

  dog.crying();
  cat.crying();
  bird.crying();
}
