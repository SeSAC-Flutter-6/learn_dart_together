
import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

void main(List<String> arguments) {
  // 객체 생성

  // 가상세계에 용사를 생성

  // 용사는 이름과 hp를 반드시 가져야함
  Hero hero = Hero(name: '아리', hp: 100);

  final hero1 = Hero(name: '슈퍼맨', hp: 100);

  //영웅의 검 장착
  final sword = Sword(name: '불꽃의 검', damage: 5);

  // A. 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
  // Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
  // print('클레릭 정보 : (name: ${cleric.name}, hp: ${cleric.hp}, mp: ${cleric.mp})');

  // B. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다.
  //    이 때, MP는 최대 MP와 같은 값이 초기화 된다
  // Cleric cleric1 = Cleric(name: '힐링맨', hp: 50);
  // print('클레릭1의 정보 : name : ${cleric1.name}, hp: ${cleric1.hp}, mp: ${cleric1.mp}');

  // C. 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다.
  //    이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다

  Cleric cleric2 = Cleric(name: '힐링맨2',);
  print('힐링맨2의 정보: name: ${cleric2.name}, hp: ${cleric2.hp}, mp: ${cleric2.mp}');


}
