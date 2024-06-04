import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';


void main() {
  test('Cleric 테스트',() {
    //준비(given)
    final cleric = Cleric(name: '성직자', hp: 50, mp: 10,);

    //초기 mp
    int initMp = cleric.mp;

    //실행(when)
    int recoveryMp = cleric.pray(3);
    int recoveryMp1 = cleric.pray(2);
    int recoveryMp2 = cleric.pray(1);

    //검증(then)
    expect(cleric.mp >= 5 || cleric.mp <= 7 , equals(true));
    expect(cleric.mp >= 4 || cleric.mp <= 6 , equals(true));
    expect(cleric.mp >= 3 || cleric.mp <= 5 , equals(true));

  });
}

