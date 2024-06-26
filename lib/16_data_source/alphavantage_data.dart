class Stock {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String delistingDate;
  String status;

  Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory Stock.fromList(List<dynamic> list) {
    return Stock(
      symbol: list[0],
      name: list[1],
      exchange: list[2],
      assetType: list[3],
      ipoDate: list[4],
      delistingDate: list[5],
      status: list[6],
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
}
