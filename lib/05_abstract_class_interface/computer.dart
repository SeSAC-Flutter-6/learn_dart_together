import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String _makerName;
  Computer({
    required super.name,
    required super.price,
    required super.color,
    required String makerName,
    required super.weight,
  }) : _makerName = makerName;
  String get makerName => _makerName;
}
