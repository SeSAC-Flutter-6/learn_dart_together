import 'package:learn_dart_together/05_240611_interface/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required super.assetWeight,
    required this.makerName,
  });
}
