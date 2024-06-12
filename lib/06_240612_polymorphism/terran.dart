import 'package:learn_dart_together/06_240612_polymorphism/zerg.dart';

abstract interface class Terran {}

abstract interface class Unit {
  void group();
}

abstract interface class Structure {}

abstract interface class Treatable {
  void heal();
}

abstract interface class Worker {
  void mine();
}

abstract interface class Bionic implements Unit {} // BioUnit

abstract interface class Mechanic implements Unit {} // MechanicUnit

abstract interface class BionicStructure
    implements Structure {} //Bionic+Structure

abstract interface class MechanicStructure
    implements Structure {} //Mechanic+Structure

class Marine implements Terran, Bionic {
  @override
  void group() {}
}

class Vulture implements Terran, Mechanic {
  @override
  void group() {}
}

class Tank implements Mechanic, Terran {
  @override
  void group() {}
}

class SCV implements Terran, Mechanic, Worker {
  @override
  void mine() {
    print('자원을 채취하는 중입니다.');
  }

  void repair(Mechanic mechanic) {
    print("SCV is repairing ${mechanic.runtimeType}.");
  }

  void heal() {
    print('SCV가 치료를 받고 있습니다.');
  }

  @override
  void group() {}
}

class Medic implements Terran, Bionic, Treatable {
  @override
  void heal() {
    print('힐 주고 있습니다');
  }

  @override
  void group() {}
}
