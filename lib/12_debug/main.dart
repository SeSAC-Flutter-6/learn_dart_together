import '../01_instance_class/hero.dart';

void main() {
  final heroes = <Hero>[];

  final h1 = Hero(name: '슈퍼맨', hp: 100);
  final h2 = Hero(name: '배트맨', hp: 100);

  heroes.add(h1);
  heroes.add(h2);
  heroes.remove(h1);
  func(h1);
}

void func(Hero hero) {
  hero.name = '홍길동';
  hero.run();
}
