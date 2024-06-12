import 'package:learn_dart_together/05_240611_interface/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.name,
    required super.price,
    required super.color,
    required super.assetWeight,
    required this.isbn,
  });
}
