class ListingStatus {
  String symbol;
  String name;

  String exchange;
  String asserType;
  String ipoDate;
  String delistngDate;
  String status;

  ListingStatus({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.asserType,
    required this.ipoDate,
    required this.delistngDate,
    required this.status,
  });

  ListingStatus.fromCsv(List<String> csv)
      : symbol = csv.length > 6 ? csv[0] : '',
        name = csv.length > 6 ? csv[1] : '',
        exchange = csv.length > 6 ? csv[2] : '',
        asserType = csv.length > 6 ? csv[3] : '',
        ipoDate = csv.length > 6 ? csv[4] : '',
        delistngDate = csv.length > 6 ? csv[5] : '',
        status = csv.length > 6 ? csv[6] : '';

  @override
  String toString() {
    return 'ListingStatus{symbol: $symbol, name: $name, exchange: $exchange, asserType: $asserType, ipoDate: $ipoDate, delistngDate: $delistngDate, status: $status}';
  }
}
