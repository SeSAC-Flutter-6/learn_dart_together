enum Exchange {
  NASDAQ,
  NYSE,
  BATS,
  NYSE_ARCA,
  NYSE_MKT,
}

enum AssetType {
  Stock,
  ETF,
}

class StockInfo {
  final String symbol;
  final String name;
  final Exchange exchange;
  final AssetType assetType;
  final DateTime ipoDate;
  final String? delistingDate;
  final String status;

  static Exchange _parseExchange(String exchange) {
    exchange = exchange.replaceAll(' ', '_');

    switch (exchange) {
      case 'NASDAQ':
        return Exchange.NASDAQ;
      case 'NYSE':
        return Exchange.NYSE;
      case 'BATS':
        return Exchange.BATS;
      case 'NYSE_ARCA':
        return Exchange.NYSE_ARCA;
      case 'NYSE_MKT':
        return Exchange.NYSE_MKT;
      default:
        throw ArgumentError('Unknown exchange: $exchange');
    }
  }

  static AssetType _parseAssetType(String assetType) {
    switch (assetType) {
      case 'Stock':
        return AssetType.Stock;
      case 'ETF':
        return AssetType.ETF;
      default:
        throw ArgumentError('Unknown asset type: $assetType');
    }
  }

  static DateTime _parseDate(String date) {
    date = date.replaceAll('-', '.');
    // print(date);
    final List<int> dateParts = date.split('.').map(int.parse).toList();
    return DateTime(dateParts[0], dateParts[1], dateParts[2]);
  }

  StockInfo({
    required this.symbol,
    required this.name,
    required String exchange,
    required String assetType,
    required String ipoDate,
    required this.delistingDate,
    required this.status,
  })  : ipoDate = _parseDate(ipoDate),
        exchange = _parseExchange(exchange),
        assetType = _parseAssetType(assetType);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockInfo &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          exchange == other.exchange &&
          assetType == other.assetType &&
          ipoDate == other.ipoDate &&
          delistingDate == other.delistingDate &&
          status == other.status);

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      exchange.hashCode ^
      assetType.hashCode ^
      ipoDate.hashCode ^
      delistingDate.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return 'StockInfo{ symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status,}';
  }

  StockInfo copyWith({
    String? symbol,
    String? name,
    Exchange? exchange,
    AssetType? assetType,
    DateTime? ipoDate,
    String? delistingDate,
    String? status,
  }) {
    return StockInfo(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      exchange: (exchange ?? this.exchange).toString(),
      assetType: (assetType ?? this.assetType).toString(),
      ipoDate: (ipoDate ?? this.ipoDate).toString(),
      delistingDate: delistingDate ?? this.delistingDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'name': name,
      'exchange': exchange,
      'assetType': assetType,
      'ipoDate': ipoDate,
      'delistingDate': delistingDate,
      'status': status,
    };
  }

  factory StockInfo.fromMap(Map<String, dynamic> map) {
    return StockInfo(
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      exchange: (map['exchange'] as Exchange).toString(),
      assetType: (map['assetType'] as AssetType).toString(),
      ipoDate: (map['ipoDate'] as DateTime).toString(),
      delistingDate: map['delistingDate'] as String,
      status: map['status'] as String,
    );
  }
}
