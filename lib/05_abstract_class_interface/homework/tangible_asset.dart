import 'package:learn_dart_together/05_abstract_class_interface/homework/asset.dart';
import 'package:learn_dart_together/05_abstract_class_interface/homework/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String name;
  int price;
  String color;

  TangibleAsset({
    required this.weight,
    required this.name,
    required this.price,
    required this.color,
  });

  void uniqueOptions();

  @override
  void checkAssetType() => print('유형자산 입니다.');

  @override
  double weight;

  @override
  void weightInfo() {
    print('무게는 $weight kg 입니다.');
  }
}
