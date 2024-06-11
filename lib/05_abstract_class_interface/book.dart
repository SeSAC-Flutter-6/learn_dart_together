import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';

class Book extends TangibleAsset {
  final String _isbn;
  Book({
    required super.name,
    required super.price,
    required super.color,
    required String isbn,
    required super.weight,
  }) : _isbn = isbn;

  String get isbn => _isbn;
}
