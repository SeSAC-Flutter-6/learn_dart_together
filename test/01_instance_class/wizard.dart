import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';
import 'package:learn_dart_together/01_instance_class/wizard.dart';
import 'package:test/test.dart';


void main() {
  test('Wizard hp가 음수가 되었을 때 테스트',() {
    //준비(given)
    final wizard = Wizard(name: '마법사', mp: 100, hp: -1);

    expect(wizard.hp == 0, true);

    //실행(when)




    //검증(then)
        

  });
}

