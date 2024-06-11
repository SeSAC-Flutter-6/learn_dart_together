import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';
import 'package:test/test.dart';

class Book extends TangibleAsset {
  String isbn;
  double _weight;

  Book(super.name, super.price, super.color, this.isbn, this._weight);

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
  test('Book weight test', () {
    final book = Book('Book', 1000, 'Red', '1234567890', 2.98);
    expect(book.weight, equals(0.98)); // 예상하는 값과 실제 값이 다르면 터지는 지
  });
}
