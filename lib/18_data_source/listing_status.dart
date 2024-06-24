class ListingStatus {
  String symbol;
  String name;

  // String exchange;
  // String asserType;
  // String ipoDate;
  // String delistngDate;
  // String status;

  ListingStatus({
    required this.symbol,
    required this.name,
    // required this.exchange,
    // required this.asserType,
    // required this.ipoDate,
    // required this.delistngDate,
    // required this.status,
  });

  ListingStatus.fromCsv(List<String> csv)
      : symbol = csv[0],
        name = csv[2];

  @override
  String toString() {
    return 'ListingStatus{symbol: $symbol, name: $name}';
  }

// name = csv[1] ?? '',
// exchange = csv[2] ?? '',
// asserType = csv[3] ?? '',
// ipoDate = csv[4] ?? '',
// delistngDate = csv[5] ?? '',
// status = csv[6] ?? ''
// ;
}
