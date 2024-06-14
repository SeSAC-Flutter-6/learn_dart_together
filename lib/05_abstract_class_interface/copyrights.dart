//상표권
import 'package:learn_dart_together/05_abstract_class_interface/intangible_asset.dart';

class Copyrights extends IntangibleAsset {
  String copyrightOwner; //상표권자

  Copyrights({
    required super.id,
    required super.name,
    required super.price,
    required this.copyrightOwner,
  });
}
