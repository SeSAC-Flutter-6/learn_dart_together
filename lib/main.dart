import 'package:learn_dart_together/cleric.dart';

void main() {
  Cleric cleric = Cleric(name: "성직자", hp: 40, mp: 10);
  cleric.selfAid();
  cleric.pray(3);
}
