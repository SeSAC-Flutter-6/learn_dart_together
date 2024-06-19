import 'package:learn_dart_together/01_instance_class/hero.dart';


void main() {
  final heroes = <Hero>{};

  final h1 = Hero(name: 'name', hp: 100);
  final h2 = Hero(
      name: 'name',
      hp: 100); //h1과 h2는 저장되는 메모리가 다름. set은 중복이 안되기 때문에 컴파일러가 둘이 같지 않게 보는 것임

  print(h1 == h2); //false 해시코드가 달라서
  print(h1.hashCode);
  print(h1.hashCode);

  heroes.add(h1);
  // heroes.add(h2);

  heroes.remove(h2);

  print(heroes.length);
}
// void main(Hero hero) {
//   hero.name = '홍길동';
//
// }
