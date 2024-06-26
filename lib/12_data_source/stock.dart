class Stock {
  final String symbol;
  final String name;
  final String exchange;
  final AssetType assetType;
  final DateTime ipoDate;
  final DateTime delistingDate;
  final StockStatus status;

  Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory Stock.fromCSV(List<String> csvRow) {
    return Stock(
      symbol: csvRow[0],
      name: csvRow[1],
      exchange: csvRow[2],
      assetType: csvRow[3] == 'Stock' ? AssetType.stock : AssetType.etf,
      ipoDate: DateTime.tryParse(csvRow[4]) ?? DateTime(2999, 12, 31),
      delistingDate: DateTime.tryParse(csvRow[5]) ?? DateTime(2999, 12, 31),
      status: csvRow[6].toLowerCase() == 'active'
          ? StockStatus.active
          : StockStatus.delisted,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Stock &&
          other.runtimeType == runtimeType &&
          other.symbol == symbol &&
          other.name == name &&
          other.exchange == exchange &&
          other.assetType == assetType;

  @override
  int get hashCode => Object.hash(
        symbol,
        name,
        name,
        exchange,
        assetType,
      );

  @override
  String toString() {
    return 'Stock(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, '
        'ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status)';
  }

  Stock copyWith({
    String? symbol,
    String? name,
    String? exchange,
    AssetType? assetType,
    DateTime? ipoDate,
    DateTime? delistingDate,
    StockStatus? status,
  }) {
    return Stock(
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

enum AssetType { stock, etf }

enum StockStatus { active, delisted }
