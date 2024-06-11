import 'package:learn_dart_together/05_abstract_class_interface/asset/asset.dart';
import 'package:learn_dart_together/05_abstract_class_interface/asset/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  @override
  double weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required this.weight,
  });
}
