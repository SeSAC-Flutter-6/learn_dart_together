//유형자산이면서 Asset과 Thing을 interface에서 implements 한다

import 'package:learn_dart_together/05_abstract_class_interface/asset.dart';
import 'package:learn_dart_together/05_abstract_class_interface/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;

  @override
  double weight;



  TangibleAsset({

    required super.id,
    required super.price,
    required super.name,
    required this.color,
    required this.weight,
});

}