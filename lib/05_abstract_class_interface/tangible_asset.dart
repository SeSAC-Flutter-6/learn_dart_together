import 'package:learn_dart_together/05_abstract_class_interface/thing.dart';

import 'asset.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;
  double _weight;

  @override
  // TODO: implement weight
  double get weight => _weight;

  @override
  set weight(double value) {
    // TODO: implement weight
    _weight = value;
  }

  TangibleAsset(super.name, super.price, this.color, this._weight);
}
