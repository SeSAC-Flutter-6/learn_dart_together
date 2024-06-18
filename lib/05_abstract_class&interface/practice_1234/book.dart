import 'tangible_asset.dart';

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
  void rent(int piece, int days) {
    print('$piece권을 $days일간 대여합니다');
  }
}
