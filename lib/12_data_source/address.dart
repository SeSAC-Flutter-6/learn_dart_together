class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  double geoLat;
  double geoLng;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geoLat,
    required this.geoLng,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geoLat: double.parse(json['geo']['lat']),
      geoLng: double.parse(json['geo']['lng']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': {
        'lat': geoLat,
        'lng': geoLng,
      },
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Address &&
          other.runtimeType == runtimeType &&
          other.street == street &&
          other.suite == suite &&
          other.city == city &&
          other.zipcode == zipcode &&
          other.geoLat == geoLat &&
          other.geoLng == geoLng;

  @override
  int get hashCode => Object.hash(
        street,
        suite,
        city,
        zipcode,
        geoLat,
        geoLng,
      );

  @override
  String toString() {
    return 'Address{street: $street, suite: $suite, city: $city, zipcode: $zipcode, geoLat: $geoLat, geoLng: $geoLng}';
  }

  Address copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    double? geoLat,
    double? geoLng,
  }) {
    return Address(
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipcode: zipcode ?? this.zipcode,
      geoLat: geoLat ?? this.geoLat,
      geoLng: geoLng ?? this.geoLng,
    );
  }
}
