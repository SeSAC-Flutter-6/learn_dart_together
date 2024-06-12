import 'unit.dart';

abstract class AttackUnit extends Unit {
  int get damage;

  set damage(int value);

  void attack(Unit target);
}
