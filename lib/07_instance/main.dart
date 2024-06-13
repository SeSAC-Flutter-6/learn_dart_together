import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  String string = 'hello';

  Object object = '111';

  Hero hero1 = Hero(name: 'name', hp: 50);
  Hero hero2 = Hero(name: 'name', hp: 40);

  print(hero1 == hero2);

  print(hero1);

  //프린트에서 생략이 가능해서 .toString()은 그동안 생략했다
  print(hero1.toString());


  // 모든 객체는 == 이 사용가능하다
  // hashcode : 내가 원하는 객체를 찾을때 그냥 찾을거냐 숫자를 부여해서 찾는게 좋으냐? 객체를 해시값으로 표현


  final heroes = <Hero>{};

  final h1 = Hero(name: '용사1', hp: 100);
  final h2 = Hero(name: '용사2', hp: 100);

  heroes.add(h1);
  heroes.remove(h2);
  // 해시코드는 메모리주소는 아니다
  // 그러나 identical(this.other) 나(this)하고 다른(other) 진짜 다른건지 확인하는 코드



}



class AAA extends Object {
  //모든 클래스는 오브젝트를 상속 받고 있어

}