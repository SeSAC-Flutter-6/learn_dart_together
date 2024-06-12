//interface - 기능(다중상속), abs - 속성, 기능
//unit -abstract class

//unit이랑 structure는 abstract로 만들어 줄 것
//인터페이스는 추상 클래스는 상속 X,

import 'package:learn_dart_together/06_240612_polymorphism/zerg.dart';
import 'package:learn_dart_together/06_240612_polymorphism/terran.dart';

abstract interface class Protoss {
  void shield();
}

class Zealot implements Protoss, Bionic, Treatable {
  @override
  void heal() {}
  @override
  void shield() {}
  @override
  void group() {}
}

class Dragun implements Protoss, Mechanic, Treatable {
  @override
  void heal() {}
  @override
  void shield() {}
  @override
  void group() {}
}
