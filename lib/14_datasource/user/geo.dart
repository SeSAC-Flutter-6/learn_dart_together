class Geo {
  double lat;
  double lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  Geo copyWith({
    double? lat,
    double? lng,
  }) {
    return Geo(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': '$lat',
        'lng': '$lng',
      };

  Geo.fromJson(Map<String, dynamic> json)
      : lat = double.parse(json['lat']),
        lng = double.parse(json['lng']);

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  @override
  bool operator ==(covariant Geo other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
