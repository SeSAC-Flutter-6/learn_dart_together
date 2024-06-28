class MaskStoreDto {
  int? count;
  List<StoreDto>? stores;

  MaskStoreDto({this.count, this.stores});

  MaskStoreDto.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    stores = json["stores"] == null
        ? null
        : (json["stores"] as List).map((e) => StoreDto.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    if (stores != null) {
      data["stores"] = stores?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class StoreDto {
  String? addr;
  String? code;
  String? createdAt;
  double? lat;
  double? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  StoreDto(
      {this.addr,
      this.code,
      this.createdAt,
      this.lat,
      this.lng,
      this.name,
      this.remainStat,
      this.stockAt,
      this.type});

  StoreDto.fromJson(Map<String, dynamic> json) {
    addr = json["addr"];
    code = json["code"];
    createdAt = json["created_at"];
    lat = json["lat"];
    lng = json["lng"];
    name = json["name"];
    remainStat = json["remain_stat"];
    stockAt = json["stock_at"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["addr"] = addr;
    data["code"] = code;
    data["created_at"] = createdAt;
    data["lat"] = lat;
    data["lng"] = lng;
    data["name"] = name;
    data["remain_stat"] = remainStat;
    data["stock_at"] = stockAt;
    data["type"] = type;
    return data;
  }
}
