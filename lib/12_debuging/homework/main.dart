import 'dart:convert';

void main() {
  final String jsonString = '''{
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

  Map<String, dynamic> jsonDecodeData = jsonDecode(jsonString);
  List<dynamic> jsonDataList = jsonDecodeData['collectionChartDataList'];
  List<CollectionChartDataList> collectionChartDataList = jsonDataList.map((json) => CollectionChartDataList.fromJson(json)).toList();

  for (var item in collectionChartDataList) {
    print(item);
  }

}

class CollectionSalePrice {
  double price;
  String cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = json['cvtDatetime'];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionSalePrice &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          cvtDatetime == other.cvtDatetime;

  @override
  int get hashCode => price.hashCode ^ cvtDatetime.hashCode;

  @override
  String toString() {
    return 'CollectionSalePrice{price: $price, cvtDatetime: $cvtDatetime}';
  }

  CollectionSalePrice copyWith({
    double? price,
    String? cvtDatetime,
  }) {
    return CollectionSalePrice(
      price: price ?? this.price,
      cvtDatetime: cvtDatetime ?? this.cvtDatetime,
    );
  }
}

class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice =
        json['collectionSalePrice'] != null ? (json['collectionSalePrice'] as List)
            .map((item) => CollectionSalePrice.fromJson(item))
            .toList()
            : null;




  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionChartDataList &&
          runtimeType == other.runtimeType &&
          collectionName == other.collectionName &&
          collectionSalePrice == other.collectionSalePrice;

  @override
  int get hashCode => collectionName.hashCode ^ collectionSalePrice.hashCode;

  @override
  String toString() {
    return 'CollectionChartDataList{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }

  CollectionChartDataList copyWith({
    String? collectionName,
    List<CollectionSalePrice>? collectionSalePrice,
  }) {
    return CollectionChartDataList(
      collectionName: collectionName ?? this.collectionName,
      collectionSalePrice: collectionSalePrice ?? this.collectionSalePrice,
    );
  }
}
