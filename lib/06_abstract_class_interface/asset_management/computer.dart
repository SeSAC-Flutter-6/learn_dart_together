import 'package:learn_dart_together/06_abstract_class_interface/asset_management/tangible_asset.dart';

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
  void touch(String name) {
    print('$name 컴퓨터를 만집니다.');
  }
}
