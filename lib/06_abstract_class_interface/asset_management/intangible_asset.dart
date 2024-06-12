import 'package:learn_dart_together/06_abstract_class_interface/asset_management/asset.dart';

abstract class IntangibleAsset extends Asset {
  bool isHumanResource;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.isHumanResource,
  });
}
