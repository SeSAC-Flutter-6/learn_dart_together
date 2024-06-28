class Store {
  final String address;
  final num latitude;
  final num longitude;
  final String name;
  final String remainStatus;

//<editor-fold desc="Data Methods">
  Store({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.remainStatus,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          name == other.name &&
          remainStatus == other.remainStatus);

  @override
  int get hashCode =>
      address.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      name.hashCode ^
      remainStatus.hashCode;

  @override
  String toString() {
    return 'Store{ address: $address, latitude: $latitude, longitude: $longitude, name: $name, remainStatus: $remainStatus,}';
  }

  Store copyWith({
    String? address,
    num? latitude,
    num? longitude,
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

//</editor-fold>
}
