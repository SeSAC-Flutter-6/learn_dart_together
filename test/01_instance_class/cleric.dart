import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';


void main() {
  test('Cleric 테스트',() {
    //준비(given)
    final cleric = Cleric('성직자', 50, 2);

    //초기 mp
    int initMp = cleric.mp;

    //실행(when)
    int recoveryMp = cleric.pray(3);

    //검증(then)
    expect(cleric.mp >= 5 || cleric.mp <= 7 , equals(true));

  });
}