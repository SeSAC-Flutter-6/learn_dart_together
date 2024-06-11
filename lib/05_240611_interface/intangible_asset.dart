import 'package:learn_dart_together/05_240611_interface/asset.dart';

abstract class IntangibleAsset extends Asset {
  bool expirationYn;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.expirationYn,
  });
}
