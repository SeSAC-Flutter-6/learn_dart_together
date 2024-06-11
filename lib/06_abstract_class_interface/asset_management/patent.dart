import 'package:learn_dart_together/06_abstract_class_interface/asset_management/intangible_asset.dart';

class Patent extends IntangibleAsset {
  String applicationNumber;

  Patent({
    required super.name,
    required super.price,
    required super.isHumanResource,
    required this.applicationNumber,
  });
}
