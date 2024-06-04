
import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

void main(List<String> arguments) {
  //객체 생성

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
  Cleric cleric1 = Cleric(name: '힐링맨', hp: 50);
  print('클레릭1의 정보 : name : ${cleric1.name}, hp: ${cleric1.hp}, mp: ${cleric1.mp}');

  Slime slime1 = Slime(50, '슬라임A');
  Slime slime2 = Slime(40, '슬라임B');





  // hero.attack();
  // hero.run();
  // hero.sleep();
  // slime1.run();
  // slime2.run();
  // cleric.selfAid();
  // print('현재 mp는 ${cleric.mp}');
  // cleric.selfAid();
  // print('현재 mp는 ${cleric.mp}');
  // print('${cleric.name}이 회복기능을 사용했습니다. 현재 mp는 ${cleric.mp} 입니다.');
  // print('2초만큼 기도했습니다. ${cleric.pray(2)} 만큼 mp가 회복됩니다');
  // print('현재 mp는 ${cleric.mp} 입니다');
  //
  // // pray 메서드 테스트
  // int recoveredMp = cleric.pray(3);
  // print('실제로 회복된 MP 양: $recoveredMp');
  // print('현재 MP: ${cleric.mp}');
  // int recoveredMp2 = cleric.pray(3);
  // print('실제로 회복된 MP 양: $recoveredMp2');
  // print('현재 MP: ${cleric.mp}');
  hero1.sword;
  //240604

}
