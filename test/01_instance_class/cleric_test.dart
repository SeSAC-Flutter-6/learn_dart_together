import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  group('selfAid test', () {
    test('mp >= 5', () {
      final cleric = Cleric(name: '성직자', hp: 20, mp: 10);

      cleric.selfAid();

      expect((cleric.hp, cleric.mp), (50, 5));
    });

    test('mp < 5', () {
      final cleric = Cleric(name: '성직자', hp: 20, mp: 3);

      cleric.selfAid();

      expect((cleric.hp, cleric.mp), (20, 3));
    });
  });

  group('pray test', () {
    test('mp < maxMp', () {
      final cleric = Cleric(name: '성직자', hp: 50, mp: 2);

      final result = cleric.pray(seconds: 3);

      expect(result, inInclusiveRange(3, 5));
    });

    test('pray test: mp == maxMp', () {
      final cleric = Cleric(name: '성직자', hp: 50, mp: 10);

      final result = cleric.pray(seconds: 3);

      expect(result, 0);
    });
  });
}
