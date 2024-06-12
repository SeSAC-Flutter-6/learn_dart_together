import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';
import 'package:test/test.dart';

class Book extends TangibleAsset {
  String isbn;

  Book(super.name, super.price, super.color, super.weight, this.isbn);
}

void main() {
  test('Book weight test', () {
    final book = Book('Book', 1000, 'Red', 2.98, '1234567890');
    expect(book.weight, equals(0.98)); // 예상하는 값과 실제 값이 다르면 터지는 지
  });
}
