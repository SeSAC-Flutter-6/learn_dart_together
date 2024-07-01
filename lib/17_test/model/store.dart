// {
// "addr": "서울특별시 강북구 솔매로 38 (미아동)",
// "code": "11817488",
// "created_at": "2020/07/03 11:00:00",
// "lat": 37.6254369,
// "lng": 127.0164096,
// "name": "승약국",
// "remain_stat": "plenty",
// "stock_at": "2020/07/02 18:05:00",
// "type": "01"
// }

class Store {
  final String address;
  final double latitude;
  final double longitude;
  final String title;
  final String remainStatus;
  final String type;

//<editor-fold desc="Data Methods">
  const Store({
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
      (other is Store &&
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
    return 'Store{' +
        ' address: $address,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' title: $title,' +
        ' remainStatus: $remainStatus,' +
        ' type: $type,' +
        '}';
  }

  Store copyWith({
    String? address,
    double? latitude,
    double? longitude,
    String? title,
    String? remainStatus,
    String? type,
  }) {
    return Store(
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      title: title ?? this.title,
      remainStatus: remainStatus ?? this.remainStatus,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': this.address,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'title': this.title,
      'remainStatus': this.remainStatus,
      'type': this.type,
    };
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      title: map['title'] as String,
      remainStatus: map['remainStatus'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}
