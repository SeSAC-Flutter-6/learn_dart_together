import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  String registrationDate;
  String expirationDate;
  String category;
  String owner;

  IntangibleAsset(super.name, super.price, this.registrationDate,
      this.expirationDate, this.category, this.owner);
}
