import 'dart:convert';

void main() {
  final String jsonStr = '''{
  "collectionChartDataList": [
    {
      "collectionName": "collectionName",
      "collectionSalePrice": null
    },
    {
      "collectionName": "collectionName",
      "collectionSalePrice": [
        {
          "price": 59.75,
          "cvtDatetime": "2023-03-26T08:08:35"
        },
        {
          "price": 60.00,
          "cvtDatetime": "2023-03-26T08:08:45"
        }
      ]
    }
  ]
 }''';

  Map<String, dynamic> jsonData = jsonDecode(jsonStr);

  List<dynamic> collectionChartDataListJson =
      jsonData['collectionChartDataList'];
  List<CollectionChartData> collectionChartDataList =
      collectionChartDataListJson
          .map((item) => CollectionChartData.fromJson(item))
          .toList();
}

class CollectionSalePrice {
  final double price;
  final DateTime cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  factory CollectionSalePrice.fromJson(Map<String, dynamic> json) {
    return CollectionSalePrice(
      price: json['price'] is String
          ? double.parse(json['price'])
          : (json['price'] as num?)?.toDouble() ?? 0.0,
      cvtDatetime: DateTime.parse(json['cvtDatetime'] ?? '1970-01-01'),
    );
  }
}

class CollectionChartData {
  final String collectionName;
  final List<CollectionSalePrice> collectionSalePrice;

  CollectionChartData(
      {required this.collectionName,
      List<CollectionSalePrice>? collectionSalePrice})
      : collectionSalePrice = collectionSalePrice ?? [];

  factory CollectionChartData.fromJson(Map<String, dynamic> json) {
    return CollectionChartData(
      collectionName: json['collectionName'] ?? '',
      collectionSalePrice: (json['collectionSalePrice'] as List<dynamic>?)
              ?.map((item) => CollectionSalePrice.fromJson(item))
              .toList() ??
          [],
    );
  }
}
