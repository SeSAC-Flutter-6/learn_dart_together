import 'intangible_asset.dart';

class Copyright extends IntangibleAsset {
  String coholder;
  int expirationDate;

  Copyright({
    required this.coholder,
    required this.expirationDate,
    required super.name,
    required super.price,
    required super.description,
    required super.registrationDate,
  });

  @override
  void rent(int piece, int days) {
    print('저작권 $piece개를 $days/365일간 대여합니다');
  }
}
