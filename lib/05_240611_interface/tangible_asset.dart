import 'package:learn_dart_together/05_240611_interface/asset.dart';
import 'package:learn_dart_together/05_240611_interface/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset(
      {required super.name,
      required super.price,
      required this.color,
      required double assetWeight})
      : _weight = assetWeight;

  @override
  void set weight(double weight) {
    _weight = weight;
  }

  double get weight {
    return _weight;
  }
}
