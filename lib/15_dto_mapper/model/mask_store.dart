class MaskStore {
  final String address;
  final double latitude;
  final double longitude;
  final String title;
  final MaskRemainStatus remainStatus;
  final String type;

  const MaskStore({
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.remainStatus,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaskStore &&
          runtimeType == other.runtimeType &&
          address == other.address &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          title == other.title &&
          remainStatus == other.remainStatus &&
          type == other.type);

  @override
  int get hashCode =>
      address.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      title.hashCode ^
      remainStatus.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Store{ address: $address, latitude: $latitude, longitude: $longitude, title: $title, remainStatus: $remainStatus, type: $type,}';
  }

  MaskStore copyWith({
    String? address,
    double? latitude,
    double? longitude,
    String? title,
    MaskRemainStatus? remainStatus,
    String? type,
  }) {
    return MaskStore(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      title: title ?? this.title,
      remainStatus: remainStatus ?? this.remainStatus,
      type: type ?? this.type,
    );
  }
}

enum MaskRemainStatus {
  plenty,
  some,
  few,
  empty,
  onBreak,
  unknown,
}
