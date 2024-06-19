import 'dart:convert';

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



class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    this.collectionSalePrice,
  });




  Map<String, dynamic> tojson() => {
        'collectionName': collectionName,
        'collectionSalePrice': collectionSalePrice?.tojson,
      };


  CollectionChartDataList.fromJson(Map<String, dynamic> json)
      : collectionName = json['name'],
        collectionSalePrice = CollectionSalePrice.fromJson(json['cvtDateTime']);
}

class CollectionSalePrice {
  double price;
  DateTime cvtDateTime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDateTime,
  });

  Map<String, dynamic> tojson() => {
        'price': price,
        'cvtDateTime': cvtDateTime.toIso8601String(),//DateTime을 직렬화로 바꿀때 씀
      };

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'].toDouble,
        cvtDateTime = json['cvtDateTime'];
}
void main() {
  Map<String,dynamic> jsonString = jsonDecode(json);
  List<dynamic> collection = jsonString['collectionChartDataList'];
  collection.forEach((e) => print(e));

}