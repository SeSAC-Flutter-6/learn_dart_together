import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';
import 'package:learn_dart_together/01_instance_class/wizard.dart';
import 'package:test/test.dart';


void main() {
  test('Wizard hp가 음수가 되었을 때 테스트',() {
    //준비(given)
    final Wizard wizard = Wizard(name: '마법사', mp: 100, hp: 100);
    Slime slime = Slime(100, 'suffix');


    //실행(when)
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);
    slime.attack(wizard);


    //검증(then)
    expect(wizard.hp == 0, true);

  });
}

