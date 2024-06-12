import 'package:learn_dart_together/05_abstract_class_interface/intangible_asset.dart';

//특허는 산업재산권의 일종
class Patent extends IntangibleAsset {
  DateTime expirationDate;
  Patent({
    required super.name,
    required super.price,
    required this.expirationDate,
  }) : super(type: IntangibleAssetType.industrialProperty);
}
