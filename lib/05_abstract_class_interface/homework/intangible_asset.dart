import 'package:learn_dart_together/05_abstract_class_interface/homework/asset.dart';

abstract class IntangibleAsset extends Asset { //'나' class

  IntangibleAsset({
    required super.name,
    required super.price,
    required super.isRare,
  });

  @override
  void checkAssetType() => print('무형자산 입니다.');
}
