import 'geo.dart';

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String?,
        suite: json['suite'] as String?,
        city: json['city'] as String?,
        zipcode: json['zipcode'] as String?,
        geo: json['geo'] == null
            ? null
            : Geo.fromJson(json['geo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toJson(),
      };
}
