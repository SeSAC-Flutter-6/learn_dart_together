class Store {
  final String addr;
  final String code;
  final DateTime createdAt;
  final double lat;
  final double lng;
  final String name;
  final String remainStat;
  final DateTime stockAt;
  final String type;
  Store({
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

  Store copyWith({
    String? addr,
    String? code,
    DateTime? createdAt,
    double? lat,
    double? lng,
    String? name,
    String? remainStat,
    DateTime? stockAt,
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

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      addr: map['addr'] as String,
      code: map['code'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      name: map['name'] as String,
      remainStat: map['remain_stat'] as String,
      stockAt: DateTime.parse(map['stock_at'] as String),
      type: map['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'addr': addr,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt,
      'type': type,
    };
  }

  @override
  String toString() {
    return 'Store(addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type)';
  }

  @override
  bool operator ==(covariant Store other) {
    if (identical(this, other)) return true;

    return other.addr == addr &&
        other.code == code &&
        other.createdAt == createdAt &&
        other.lat == lat &&
        other.lng == lng &&
        other.name == name &&
        other.remainStat == remainStat &&
        other.stockAt == stockAt &&
        other.type == type;
  }

  @override
  int get hashCode {
    return addr.hashCode ^
        code.hashCode ^
        createdAt.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        name.hashCode ^
        remainStat.hashCode ^
        stockAt.hashCode ^
        type.hashCode;
  }
}
