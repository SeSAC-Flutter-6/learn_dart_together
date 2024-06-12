import 'package:learn_dart_together/06_polymorphism/starcraft/object/unit/protoss/dragun.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/object/unit/terran/marine.dart';
import 'package:learn_dart_together/06_polymorphism/starcraft/object/unit/terran/medic.dart';

import 'object/unit/protoss/zealot.dart';
import 'object/unit/terran/scv.dart';
import 'type/unit_type/unit.dart';

void main() {
  // 원래는 test_code 작성하여 test 해야하나....
  Zealot z = Zealot();
  z.hp = 5;
  z.shield = 5;
  z.chargeShield();
  print('질럿의 hp : ${z.hp}');
  print('질럿의 쉴드 : ${z.shield}');

  Medic medic = Medic();
  medic.heal(z);
  print('heal 후 질럿의 hp : ${z.hp}');

  Dragun dragun = Dragun();
  dragun.hp = 1;
  medic.heal(dragun);
  print('heal 후 drgun의 hp : ${dragun.hp}');

  Scv scv = Scv();
  scv.hp = 1;
  medic.heal(scv);
  print('heal 후 scv의 hp : ${scv.hp}');

  Scv powerScv = Scv();
  powerScv.repair(scv);
  print('수리 후 scv의 hp : ${scv.hp}');

  // 자가치료 테스트
  powerScv.repair(powerScv);

  // 그룹화 테스트
  int idx = 0;
  List<Unit> group = [];
  while (idx < 10) {
    if (idx < 5) {
      group.add(Marine());
    } else {
      group.add(Medic());
    }
    idx++;
  }
  print('마린의 개수 : ${group.whereType<Marine>().length}');
  print('메딕의 개수 : ${group.whereType<Medic>().length}');
}
