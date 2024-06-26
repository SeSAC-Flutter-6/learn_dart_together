class Asset {
  String symbol;
  String name;
  String exchange;
  String assetType;
  DateTime ipoDate;
  DateTime delistingDate;
  bool isActive;

  Asset({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.isActive,
  });

  Asset.fromCsv(List<dynamic> csv)
      : symbol = csv[0],
        name = csv[1],
        exchange = csv[2],
        assetType = csv[3],
        ipoDate = DateTime.tryParse(csv[4]) ?? DateTime(0, 1, 1),
        delistingDate = DateTime.tryParse(csv[5]) ?? DateTime(0, 1, 1),
        isActive = csv[6] == 'Active' ? true : false;

  @override
  String toString() =>
      'Asset(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, isActive: $isActive)';
}
