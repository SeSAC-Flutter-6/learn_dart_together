import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';
import 'package:test/test.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer(super.name, super.price, super.color, super.weight, this.makerName);
}

void main() {
  test('Computer weight test', () {
    final computer = Computer('Book', 1000, 'Red', 0.98, '1234567890');
    expect(computer.weight, equals(0.98)); // 예상하는 값과 실제 값이 같은지 확인
  });
}
