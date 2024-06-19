import '../01_instance_class/hero.dart';

void main() {
  final heroes = <Hero>{};

  List<int> numbers = [1,2,3];
  final h1 = Hero(name: 'name', hp: 100);
  final h2 = Hero(name: 'name', hp: 100);

  heroes.add(h1);
}