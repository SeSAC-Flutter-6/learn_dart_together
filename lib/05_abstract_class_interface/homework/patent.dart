import 'package:learn_dart_together/05_abstract_class_interface/homework/intangible_asset.dart';

class Patent extends IntangibleAsset { //'다' class
  Patent({
    required super.name,
    required super.price,
    required super.isRare,
  });
}
