import 'package:learn_dart_together/05_240611_interface/intangible_asset.dart';

class Patent extends IntangibleAsset {
  int patentNumber;
  String issueCountry;
  String patentOwner;

  Patent({
    required super.name,
    required super.price,
    required super.expirationYn,
    required this.patentNumber,
    required this.issueCountry,
    required this.patentOwner,
  });
}
