import 'dart:convert';

void main() {
  final String json = '''{
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
  final data = jsonDecode(json)['collectionChartDataList'] as List;
  final decoded = data.map((data) => CollectionChartData.fromJson(data));

  print(decoded);
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    this.collectionSalePrice,
  });

  CollectionChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = (json['collectionSalePrice'] as List<dynamic>?)
                ?.map((e) => CollectionSalePrice.fromJson(e))
                .toList() ??
            [];

  @override
  String toString() {
    return 'CollectionChartData{collectionName: $collectionName, collectionSalePrice: $collectionSalePrice}';
  }
}

class CollectionSalePrice {
  num price;
  String cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = json['cvtDatetime'];

  @override
  String toString() {
    return 'CollectionSalePrice{price: $price, cvtDatetime: $cvtDatetime}';
  }
}
