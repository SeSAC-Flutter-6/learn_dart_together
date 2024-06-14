import 'hero.dart';

void main() {
  final heroes = <Hero>[];
  final h1 = Hero(name: '홍길동', hp: 100);
  final h2 = Hero(name: '임꺽정', hp: 100);

  heroes.add(h1);
  print(heroes.length);
  heroes.remove(h2);
  print(heroes.length);
}
