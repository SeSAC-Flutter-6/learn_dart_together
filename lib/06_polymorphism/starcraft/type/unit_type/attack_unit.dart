import 'unit.dart';

abstract interface class AttackUnit implements Unit {
  int get damage;

  set damage(int value);

  void attack(Unit target);
}
