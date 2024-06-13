//무형자산이면서 Asset을 interface에서 implements 한다

import 'package:learn_dart_together/05_abstract_class_interface/asset.dart';

abstract class IntangibleAsset extends Asset {
  IntangibleAsset({
    required super.id,
    required super.name,
    required super.price,
  });
}
