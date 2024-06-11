import 'package:learn_dart_together/05_abstract_interface/asset.dart';
import 'package:learn_dart_together/05_abstract_interface/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  double get weight => _weight;
  set weight(double value) => _weight = value;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required double weight,
  }) : _weight = weight;
}