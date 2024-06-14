import '../01_instance_class/hero.dart';

void main() {
  // Set, Map = HashCode 기반으로 동작
  final heroes = <Hero>{};

  final h1 = Hero(name: 'name', hp: 100);
  final h2 = Hero(name: 'name', hp: 100);

  print(h1 == h2);  // true

  print(h1.hashCode);
  print(h2.hashCode);

  heroes.add(h1);
  // heroes.add(h2);
  heroes.remove(h2);

  print(heroes.length);   // 1, 0
}