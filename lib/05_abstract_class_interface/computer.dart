import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';
import 'package:test/test.dart';

class Computer extends TangibleAsset {
  String makerName;
  double _weight;

  Computer(super.name, super.price, super.color, this.makerName, double weight)
      : _weight = weight;

  @override
  // TODO: implement weight
  double get weight => _weight;

  @override
  set weight(double value) {
    // TODO: implement weight
    _weight = value;
  }
}

void main() {
  test('Computer weight test', () {
    final computer = Computer('Book', 1000, 'Red', '1234567890', 0.98);
    expect(computer.weight, equals(0.98)); // 예상하는 값과 실제 값이 같은지 확인
  });
}
