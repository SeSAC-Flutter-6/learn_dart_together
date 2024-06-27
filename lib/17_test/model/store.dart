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
  final String addr;
  final String code;
  final String createdAt;
  final double lat;
  final double lng;
  final String name;
  final String remainStat;
  final String stockAt;
  final String type;

//<editor-fold desc="Data Methods">
  const Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          addr == other.addr &&
          code == other.code &&
          createdAt == other.createdAt &&
          lat == other.lat &&
          lng == other.lng &&
          name == other.name &&
          remainStat == other.remainStat &&
          stockAt == other.stockAt &&
          type == other.type);

  @override
  int get hashCode =>
      addr.hashCode ^
      code.hashCode ^
      createdAt.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      name.hashCode ^
      remainStat.hashCode ^
      stockAt.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Store{ addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type,}';
  }

  Store copyWith({
    String? addr,
    String? code,
    String? createdAt,
    double? lat,
    double? lng,
    String? name,
    String? remainStat,
    String? stockAt,
    String? type,
  }) {
    return Store(
      addr: addr ?? this.addr,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remainStat: remainStat ?? this.remainStat,
      stockAt: stockAt ?? this.stockAt,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'createdAt': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remainStat': remainStat,
      'stockAt': stockAt,
      'type': type,
    };
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      addr: map['addr'] as String,
      code: map['code'] as String,
      createdAt: map['created_at'],
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      name: map['name'] as String,
      remainStat: map['remain_stat'] as String,
      stockAt: map['stock_at'],
      type: map['type'] as String,
    );
  }

//</editor-fold>
}
