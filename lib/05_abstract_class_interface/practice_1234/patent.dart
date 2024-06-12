import 'intangible_asset.dart';

class Patent extends IntangibleAsset {
  String firstInventor;
  String country;
  int regestrationNumber;
  int expirationDate;

  Patent({
    required this.firstInventor,
    required this.country,
    required this.regestrationNumber,
    required this.expirationDate,
    required super.name,
    required super.price,
    required super.description,
    required super.registrationDate,
  });

  @override
  void rent(int piece, int days) {
    print('특허 $piece개를 $days/365년간 대여합니다');
  }
}
