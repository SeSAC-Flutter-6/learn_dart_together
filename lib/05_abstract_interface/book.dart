import 'package:learn_dart_together/05_abstract_interface/tangibleAsset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.isbn,
  });
}
