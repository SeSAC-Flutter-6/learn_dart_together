import 'package:learn_dart_together/03_encapsulation/wand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Wand 클래스 생성자 테스트', () {
    test('인스턴스 생성시 이름 3글자 미만이면 exception', () {
      expect(() => Wand(name: '가지', power: 50), throwsException);
      expect(() => Wand(name: '지팡이', power: 50), returnsNormally);
      expect(() => Wand(name: '나뭇가지', power: 50), returnsNormally);
    });
    test('인스턴스 생성시 마력 0.5미만 또는 100 초과면 exception', () {
      expect(() => Wand(name: '지팡이', power: 0.4), throwsException);
      expect(() => Wand(name: '지팡이', power: 100.1), throwsException);
      expect(() => Wand(name: '지팡이', power: 0.5), returnsNormally);
      expect(() => Wand(name: '지팡이', power: 100), returnsNormally);
    });
  });
  group('Wand 클래스 exception 테스트', () {
    test('wand의 이름이 3글자 미만이면 exception', () {
      Wand wand = Wand(name: '지팡이', power: 50);
      expect(() => wand.name = '새싹', throwsException);
      expect(() => wand.name = '마술봉', returnsNormally);
      expect(() => wand.name = '나뭇가지', returnsNormally);
    });
    test('wand의 마력이 0.5미만, 100초과이면 exception', () {
      Wand wand = Wand(name: '지팡이', power: 50);
      expect(() => wand.power = 0.4, throwsException);
      expect(() => wand.power = 100.1, throwsException);
      expect(() => wand.power = 0.5, returnsNormally);
      expect(() => wand.power = 100, returnsNormally);
    });
  });
}
