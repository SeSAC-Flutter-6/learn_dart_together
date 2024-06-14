//특허권
import 'package:learn_dart_together/05_abstract_class_interface/intangible_asset.dart';

class Patent extends IntangibleAsset {
  int patentYears; //특허기간

  Patent({
    required super.id,
    required this.patentYears,
    required super.name,
    required super.price,
  });
}
