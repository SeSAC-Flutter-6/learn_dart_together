import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';
import 'package:learn_dart_together/01_instance_class/wand.dart';
import 'package:learn_dart_together/01_instance_class/wizard.dart';
import 'package:test/expect.dart';
import 'package:test/test.dart';


void main() {
  group('Wizard 테스트', () {
    test('Wizard 생성시 이름이 null 이면 예외 발생', () {
      expect(Wizard(name: '', mp: 100, hp: -1), throwsException);
      expect(Wizard(name: '론니', mp: 100, hp: -1), throwsException);
      expect(Wizard(name: '위자드', mp: 100, hp: 100), returnsNormally);
    });

    test('Wizard 생성시 mp가 0일 경우 예외 발생', () {
      expect(Wizard(name: '위자드', mp: -1, hp: 100), throwsException);
      expect(Wizard(name: '위자드', mp: 0, hp: 100), returnsNormally);
      expect(Wizard(name: '위자드', mp: 1, hp: 100), returnsNormally);
    });

    test('wand 생성시 이름 관련 예외 발생', () {
      expect(Wand(name: '지팡이', power: 100), returnsNormally);
      expect(Wand(name: '팡이', power: 100), throwsException);
      expect(Wand(name: '', power: 100), throwsException);
      expect(Wand(name: '지팡이', power: 0), throwsException);
      expect(Wand(name: '지팡이', power: 101), throwsException);
      expect(Wand(name: '지팡이', power: 99), returnsNormally);

    });


  });
}









        




