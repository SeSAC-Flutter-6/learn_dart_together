

import '../01_instance_class/hero.dart';

void main() {
 //메모리 할당함 new
  final hero1 = new Hero(name: '용사1', hp: 100);

  // dart에서는 = 기호를 쓰면 주소를 복사한다(값을 복사하는게 아니다)
 final hero2 = hero1;

 //hero2.hp = 200;

 print(hero1.hp);
}

//Constant constructors
//const를 붙인 생성자는 메모리 재사용이 가능하다

class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);
}

//Redirecting constructors
//생성자에서 기존 생성자 호출


//initializer list
//생성자 이후에 뭔가를 하면서 그것을 컴파일 타임에 하고 싶을때


class Person1 {
  final String name;
  final int age;

  const Person1(this.name, {required this.age});
}

//생성자의 오버로드는 금지
//하지만 생성자 하나로 옵셔널 네임드 파라미터등을 이용해서 여러개의 객체를 생성할 수 있다

class Person2 {
  final String name;
  final int age;

  const Person2({required this.name, required this.age});
}
