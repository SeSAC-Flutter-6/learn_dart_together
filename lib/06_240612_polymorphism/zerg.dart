import 'package:learn_dart_together/06_240612_polymorphism/terran.dart';

abstract interface class Zerg {
  void selfAid();
}

class AilenBionicBuilding implements Zerg, BionicStructure {
  @override
  void selfAid() {}
}

class Zergling implements Zerg, Bionic {
  @override
  void selfAid() {}
  @override
  void group() {}
}

class Hydra implements Zerg, Bionic {
  @override
  void selfAid() {}
  @override
  void group() {}
}
