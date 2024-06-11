import 'package:learn_dart_together/05_abstract_class_interface/homework/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.isbn,
  });

  @override
  void uniqueOptions() => print('유니크한 옵션으로 isbn을 가지고 있습니다.');
}

void main() {
  Book book = Book(
      weight: 10.5, name: '생존플러터', price: 33000, color: 'blue', isbn: '저작권');
  book.weightInfo();
  book.checkAssetType();
}
