
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

  // D. 이 클래스는 Cleric() 과 같이 이름을 지정하지 않는 경우에는 인스턴스화 할 수 없다고 한다.
  //    (이름이 없는 성직자는 존재 할 수 없음)
    ClericD clericD = ClericD('클레릭D');
    print('클레릭D의 정보: name: ${clericD.name}');

  // C. 이 클래스는 Cleric(“아서스") 와 같이 이름만을 지정하여 인스턴스화 할 수 있다.
  //    이 때, HP 와 MP 는 최대 HP와 최대 MP로 초기화 된다
    ClericC clericC = ClericC('클레릭C', hp: Cleric.maxHp, mp: Cleric.maxMp,);
    print('클레릭C의 정보: name: ${clericC.name}, hp: ${clericC.hp}, mp: ${clericC.mp}');

  // B. 이 클래스는 Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다.
  //    이 때, MP는 최대 MP와 같은 값이 초기화 된다
    ClericB clericB = ClericB('클레릭B', 50, mp: Cleric.maxMp);
    print('클레릭B의 정보: name: ${clericB.name}, hp: ${clericB.hp}, mp: ${clericB.mp}');

    // A. 이 클래스는 Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
    ClericA clericA = ClericA('클레릭A', 50, 10);
    print('클레릭A의 정보: name: ${clericA.name}, hp: ${clericA.hp}, mp: ${clericA.mp}');

    //생성자는 가능한 한 중복되는 코드가 없도록 작성한다

    final hero2 = Hero(name: '홍길동', hp: 100);
    print('영웅의 이름은 ${hero2.name = 'aa'}');
}
