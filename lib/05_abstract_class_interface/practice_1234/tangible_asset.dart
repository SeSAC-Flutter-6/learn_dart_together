import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required double weight,
  }) : _weight = weight > 0 ? weight : throw Exception('무게는 0보다 커야 합니다');

  @override
  double get getWeight => _weight;

  @override
  set setWeight(double newWeight) {
    if (newWeight > 0) {
      _weight = newWeight;
    } else {
      throw Exception('무게는 0보다 커야 합니다');
    }
  }

  @override
  void purchase() {
    print('유형자산 $name을 $price원에 구매합니다');
  }

  @override
  void sell() {
    print('유형자산 $name을 $price원에 판매합니다');
  }
}
