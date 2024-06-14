import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String str = 'eqqmayo';

  Object obj = '123';
  obj = '애옹';

  final heroes = <Hero>{};

  // 속성을 똑같이 해도 다 다른 값임: 해쉬값 다름
  final h1 = Hero(name: 'a', hp: 100);
  final h2 = Hero(name: 'a', hp: 100);

  heroes.add(h1);
  print(heroes.length); // 1

  heroes.remove(h2);
  print(heroes.length); // 1 ((==) 재정의해도 여전히 1, 영향 없음)
  // ==과 hashcode의 비교 기준을 똑같이 하려면 hash도 그에맞게 재정의 하기: 일반적인 방법

  print(h1 == h2); // false (== 정의 바꾼 후 true)
  print(h1.hashCode); // 해시코드 다르면 다른 값임
  print(h2.hashCode);

  final nums = [3, 2, 4, 1, 3];

  nums.sort();
  print(nums);

  nums.sort((a, b) => b.compareTo(a));
  print(nums);

  final hero1 = Hero(name: "김씨", hp: 10);
  final hero2 = Hero(name: "이씨", hp: 20);

  final heros = [hero2, hero2];

  heros.sort(); // comparable 인터페이스 따르지 않아서 안됨
  // comparable 상속 후 hero1, hero2 순서로 정렬됨

  // 어떤 클래스를 복사하고 싶을때
  // 깊은 복사. swift는 copy() 메서드?
  // dart는 딥카피 하려면 copyWith 만들어써야함
  final hero3 = Hero(name: "박씨", hp: 30);
  final hero4 = Hero(name: hero3.name, hp: hero3.hp);

  // final hero5 = hero3.copyWith();
  // final hero6 = hero3.copyWith(name: '최씨'); 복사하는데 이름만 바꾸고 싶을때
}

class Dog extends Object {
  // 이렇게 안해도 Object 이미 상속받고 있음
}
