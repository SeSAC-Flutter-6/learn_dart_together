import 'package:learn_dart_together/05_abstract_class_interface/homework/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.weight,
    required super.name,
    required super.price,
    required super.color,
    required this.makerName,
    required super.isRare,
  });

  @override
  void uniqueOptions() => print('유니크한 옵션으로 makerName을 가지고 있습니다. ');
}
