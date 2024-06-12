import 'package:learn_dart_together/05_abstract_class_interface/asset/asset.dart';

abstract class IntangibleAsset extends Asset {
  String expiryDate; // '240611'

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.expiryDate,
  });
}
