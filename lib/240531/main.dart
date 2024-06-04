import 'package:learn_dart_together/240531/cleric.dart';

void main() {
  Cleric cleric = Cleric('Cleric', hp: 40, mp: 5);
  print(cleric.name);
  print(cleric.hp);
  print(cleric.mp);

  Cleric cleric2 = Cleric("아서스", hp: 35);
  print(cleric2.name);
  print(cleric2.hp);
  print(cleric2.mp);

  Cleric cleric3 = Cleric("아서스");
  print(cleric3.name);
  print(cleric3.hp);
  print(cleric3.mp);
}
