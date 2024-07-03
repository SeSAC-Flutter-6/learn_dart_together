// "stores": [
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
// },

class Store {
  final String addr;
  final String code;
  final DateTime created_at;
  final num lat;
  final num lng;
  final String name;
  final String remainStat;
  final DateTime stock_at;
  final String type;

//<editor-fold desc="Data Methods">
  Store({
    required this.addr,
    required this.code,
    required this.created_at,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stock_at,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Store &&
          runtimeType == other.runtimeType &&
          addr == other.addr &&
          code == other.code &&
          created_at == other.created_at &&
          lat == other.lat &&
          lng == other.lng &&
          name == other.name &&
          remainStat == other.remainStat &&
          stock_at == other.stock_at &&
          type == other.type);

  @override
  int get hashCode =>
      addr.hashCode ^
      code.hashCode ^
      created_at.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      name.hashCode ^
      remainStat.hashCode ^
      stock_at.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Store{'
        ' addr: $addr,'
        ' code: $code,'
        ' created_at: $created_at,'
        ' lat: $lat,'
        ' lng: $lng,'
        ' name: $name,'
        ' remainStat: $remainStat,'
        ' stock_at: $stock_at,'
        ' type: $type,'
        '}';
  }

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
      created_at: createdAt ?? this.created_at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remainStat: remainStat ?? this.remainStat,
      stock_at: stockAt ?? this.stock_at,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addr': this.addr,
      'code': this.code,
      'createdAt': this.created_at,
      'lat': this.lat,
      'lng': this.lng,
      'name': this.name,
      'remainStat': this.remainStat,
      'stock_at': this.stock_at,
      'type': this.type,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      addr: map['addr'] as String,
      code: map['code'] as String,
      created_at: map['createdAt'] as DateTime,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      name: map['name'] as String,
      remainStat: map['remainStat'] as String,
      stock_at: map['stock_at'] as DateTime,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}