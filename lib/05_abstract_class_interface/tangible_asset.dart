import 'package:learn_dart_together/05_abstract_class_interface/asset.dart';
import 'package:learn_dart_together/05_abstract_class_interface/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.color,
    required double weight,
  }) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    if (value <= 0) {
      throw ArgumentError('무게는 음수일 수 없습니다');
    }
    _weight = value;
  }
}
