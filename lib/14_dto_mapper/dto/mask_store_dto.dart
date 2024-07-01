class MaskStoreListDTO {
  final num? count;
  final List<MaskStoreDTO>? stores;

  MaskStoreListDTO({
    this.count,
    this.stores,
  });

  factory MaskStoreListDTO.fromJson(dynamic json) => MaskStoreListDTO(
        count: json['count'] as num?,
        stores: (json['stores'] as List<dynamic>?)
            ?.map((e) => MaskStoreDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'stores': stores?.map((e) => e.toJson()).toList(),
      };
}

class MaskStoreDTO {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  MaskStoreDTO({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });

  factory MaskStoreDTO.fromJson(dynamic json) => MaskStoreDTO(
        addr: json['addr'] as String?,
        code: json['code'] as String?,
        createdAt: json['created_at'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
        name: json['name'] as String?,
        remainStat: json['remain_stat'] as String?,
        stockAt: json['stock_at'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
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
