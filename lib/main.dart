import 'package:learn_dart_together/cleric.dart';

void main() {
  Cleric cleric = Cleric(name: 'Cleric', hp: 50, mp: 10);
  print(cleric.name);
  print(cleric.hp);
  print(cleric.mp);

  cleric.selfAid();
  print(cleric.hp);
  print(cleric.mp);
  cleric.selfAid();
  print(cleric.mp);
  cleric.selfAid();
  print(cleric.mp);

  cleric.pray(1);
  print(cleric.mp);
  cleric.pray(1);
  print(cleric.mp);
  cleric.pray(1);
  print(cleric.mp);
}
