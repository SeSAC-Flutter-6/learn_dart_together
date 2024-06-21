class Status {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String? delistingDate;
  String status;

  Status({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  Status.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        name = json['name'],
        exchange = json['exchange'],
        assetType = json['assetType'],
        ipoDate = json['ipoDate'],
        delistingDate = json['delistingDate'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'name': name,
        'exchange': exchange,
        'assetType': assetType,
        'ipoDate': ipoDate,
        'delistingDate': delistingDate,
        'status': status,
      };

  @override
  String toString() {
    return 'Status{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Status &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          exchange == other.exchange &&
          assetType == other.assetType &&
          ipoDate == other.ipoDate &&
          delistingDate == other.delistingDate &&
          status == other.status;

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      exchange.hashCode ^
      assetType.hashCode ^
      ipoDate.hashCode ^
      delistingDate.hashCode ^
      status.hashCode;

  Status copyWith(
    String? symbol,
    String? name,
    String? exchange,
    String? assetType,
    String? ipoDate,
    String? delistingDate,
    String? status,
  ) {
    return Status(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      exchange: exchange ?? this.exchange,
      assetType: assetType ?? this.assetType,
      ipoDate: ipoDate ?? this.ipoDate,
      delistingDate: delistingDate ?? this.delistingDate,
      status: status ?? this.status,
    );
  }
}
