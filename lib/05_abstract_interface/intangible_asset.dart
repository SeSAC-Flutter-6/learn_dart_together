import 'package:learn_dart_together/05_abstract_interface/asset.dart';

abstract class IntangibleAsset extends Asset {
  IntangibleAsset({
    required super.name,
    required super.price,
  });
}