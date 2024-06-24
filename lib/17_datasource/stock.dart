class Stock {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String delistingDate;
  String istatus;

  Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.istatus,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stock &&
        other.symbol == symbol &&
        other.name == name &&
        other.exchange == exchange &&
        other.assetType == assetType &&
        other.ipoDate == ipoDate &&
        other.delistingDate == delistingDate &&
        other.istatus == istatus;
  }

  @override
  int get hashCode {
    return symbol.hashCode ^
        name.hashCode ^
        exchange.hashCode ^
        assetType.hashCode ^
        ipoDate.hashCode ^
        delistingDate.hashCode ^
        istatus.hashCode;
  }

  @override
  String toString() {
    return 'Stock(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, istatus: $istatus)';
  }

  Stock copyWith({
    String? symbol,
    String? name,
    String? exchange,
    String? assetType,
    String? ipoDate,
    String? delistingDate,
    String? istatus,
  }) {
    return Stock(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      assetType: assetType ?? this.assetType,
      ipoDate: ipoDate ?? this.ipoDate,
      delistingDate: delistingDate ?? this.delistingDate,
      istatus: istatus ?? this.istatus,
    );
  }

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'name': name,
        'exchange': exchange,
        'assetType': assetType,
        'ipoDate': ipoDate,
        'delistingDate': delistingDate,
        'istatus': istatus,
      };

  Stock.fromJson(List<dynamic> json)
      : symbol = json[0],
        name = json[1],
        exchange = json[2],
        assetType = json[3],
        ipoDate = json[4],
        delistingDate = json[5],
        istatus = json[6];
}
