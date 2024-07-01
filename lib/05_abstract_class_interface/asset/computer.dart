import 'package:learn_dart_together/05_abstract_class_interface/asset/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.weight,
    required this.makerName,
  });
}
