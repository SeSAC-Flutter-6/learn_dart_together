import 'package:learn_dart_together/01_instance_class/wand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('지팡이 제조법', () {
    test('지팡이의 이름은 3글자 이상이어야 한다.', () {
      expect(() => Wand(name: '', power: 100), throwsException);
      expect(() => Wand(name: '아', power: 100), throwsException);
      expect(() => Wand(name: '아아', power: 100), throwsException);
      expect(() => Wand(name: '아아아', power: 100), returnsNormally);
      
      final Wand wand = Wand(name: '아아아', power: 100);
      expect(() => wand.name = '', throwsException);
      expect(() => wand.name = '아', throwsException);
      expect(() => wand.name = '아아', throwsException);
      expect(() => wand.name = '아아아', returnsNormally);
    });

    test('지팡이의 마력은 0.5 ~ 100.0 이어야 한다.', () {
      expect(() => Wand(name: '아아아', power: 0.49), throwsException);
      expect(() => Wand(name: '아아아', power: 100.1), throwsException);
      expect(() => Wand(name: '아아아', power: 100.0), returnsNormally);
      expect(() => Wand(name: '아아아', power: 0.5), returnsNormally);
    });
  });
}