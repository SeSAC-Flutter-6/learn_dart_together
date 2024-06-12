import 'package:learn_dart_together/05_abstract_class_interface/intangible_asset.dart';

class Patent extends IntangibleAsset {
  String patentNumber;
  String applicationDate;
  String inventor;

  Patent(
      super.name,
      super.price,
      super.registrationDate,
      super.expirationDate,
      super.category,
      super.owner,
      this.patentNumber,
      this.applicationDate,
      this.inventor);
}
