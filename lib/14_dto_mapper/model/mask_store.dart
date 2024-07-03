class MaskStore {
  final String address;
  final double latitude;
  final double longitude;
  final String title;
  final MaskRemainStatus remainStatus;
  final String type;

//<editor-fold desc="Data Methods">
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
    return 'MaskStore{' +
        ' address: $address,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' title: $title,' +
        ' remainStatus: $remainStatus,' +
        ' type: $type,' +
        '}';
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

  Map<String, dynamic> toMap() {
    return {
      'address': this.address,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'title': this.title,
      'remainStatus': this.remainStatus,
      'type': this.type,
    };
  }

  factory MaskStore.fromMap(Map<String, dynamic> map) {
    return MaskStore(
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      title: map['title'] as String,
      remainStatus: map['remainStatus'] as MaskRemainStatus,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}

enum MaskRemainStatus {
  plenty,
  some,
  few,
  empty,
  onBreak,
  unknown,
}