import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.makerName,
  });

  @override
  void rent(int piece, int days) {
    print('$piece대를 $days일간 대여합니다');
  }
}
