import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  //Set, Map = Hashcode 기반으로 동작, 다트 버츄얼머신이 무작위로 값을 준다(모든 객체지향 언어가 동일하다)
  //객체들이 만들어지면서 해시코드들이 무작위로 부여가 됨
  final heroes = <Hero>{};

  final h1 = Hero(name: 'name', hp: 100);
  final h2 = Hero(name: 'name', hp: 100);//h1과 h2는 저장되는 메모리가 다름 다르기 때문에 각각 다른 놈으로 들어감. set은 중복이 안되는데 컴파일러가 둘이 같은 애로 안보는 것임

  //내용 똑같으면 같다고 판단하도록 ==을 오버라이드 해서 쓸 수 있다
  print(h1 == h2); //false 해시코드가 달라서
  print(h1.hashCode);
  print(h1.hashCode);

  heroes.add(h1);
  // heroes.add(h2);

  heroes.remove(h2);

  print(heroes.length);

}