import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  String description;
  int registrationDate;

  IntangibleAsset({
    required this.description,
    required this.registrationDate,
    required super.name,
    required super.price,
  });

  @override
  void purchase() {
    print('무형자산 $name을 $price원에 구매합니다');
  }

  @override
  void sell() {
    print('무형자산 $name을 $price원에 판매합니다');
  }
}
