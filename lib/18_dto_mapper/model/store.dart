class Store {
  final String address;
  final num latitude;
  final num longitude;
  final String title;


//<editor-fold desc="Data Methods">
  const Store({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.title,

  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          title == other.title);

  @override
  int get hashCode =>
      address.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      title.hashCode;


  @override
  String toString() {
    return 'Store{address: $address, latitude: $latitude, longitude: $longitude, title: $title}';
  }

  Store copyWith({
    String? addr,
    String? code,
    String? createdAt,
    num? lat,
    num? lng,
    String? name,
    String? remainStat,
    String? stockAt,
    String? type,
  }) {
    return Store(
      address: addr ?? address,
      latitude: lat ?? latitude,
      longitude: lng ?? longitude,
      title: name ?? title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': address,
      'lat': latitude,
      'lng': longitude,
      'name': title,
    };
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      address: map['addr'] as String,
      latitude: map['lat'] as num,
      longitude: map['lng'] as num,
      title: map['name'] as String,
    );
  }

//</editor-fold>
}
