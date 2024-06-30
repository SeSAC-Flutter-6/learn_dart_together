class Store {
  final String address;
  final double latitude;
  final double longitude;
  final String name;
  final String remainStatus;

  Store({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.remainStatus,
  });

  Store copyWith({
    String? address,
    double? latitude,
    double? longitude,
    String? name,
    String? remainStatus,
  }) {
    return Store(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      remainStatus: remainStatus ?? this.remainStatus,
    );
  }

  @override
  String toString() {
    return 'Store(address: $address, latitude: $latitude, longitude: $longitude, name: $name, remainStatus: $remainStatus)';
  }

  @override
  bool operator ==(covariant Store other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.name == name &&
        other.remainStatus == remainStatus;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        name.hashCode ^
        remainStatus.hashCode;
  }
}
