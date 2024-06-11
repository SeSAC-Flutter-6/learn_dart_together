import 'package:learn_dart_together/05_abstract_class_interface/thing.dart';

import 'asset.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;

  TangibleAsset(super.name, super.price, this.color);
}
