//TangibleAsset를 상속받은 Book 클래스
import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required super.id,
    required super.price,
    required super.name,
    required super.color,
    required super.weight,
    required this.isbn,
  });

  //Book의 ==동등성 비교 작성
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book && runtimeType == other.runtimeType && isbn == other.isbn;
  }
}
