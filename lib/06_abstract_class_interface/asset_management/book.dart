import 'package:learn_dart_together/06_abstract_class_interface/asset_management/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });

  @override
  void touch(String name) {
    print('$name 책을 만집니다.');
  }
}
