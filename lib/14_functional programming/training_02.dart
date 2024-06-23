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

class CollectionSalePrice {
  double price;
  String cvtDateTime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDateTime,
  });

  Map<String, dynamic> toJson() => {
    //메서드
    'price': price,
    'cvtDateTime': cvtDateTime, //DateTime을 직렬화로 바꿀때 쓴데
  };

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'].toDouble(),
        cvtDateTime = json['cvtDateTime'];
}

class CollectionChartDataList {
  String collectionName;
  CollectionSalePrice collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  Map<String, dynamic> toJson() => {
    'collectionName': collectionName,
    'collectionSalePrice': collectionSalePrice,
  };

  CollectionChartDataList.fromJson(Map<String, dynamic> json)
      : collectionName = json['name'],
        collectionSalePrice = CollectionSalePrice.fromJson(json['cvtDateTime']);
}

class DataList {
  List<CollectionChartDataList> collectionChartDataList;

  DataList(this.collectionChartDataList);

  Map<String, dynamic> toJson() => {
    'collectionChartDataList': collectionChartDataList,
  };

  DataList.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List)
      .map((e) => CollectionChartDataList.fromJson(e)).toList();
}

void main() {
  // Map<String,dynamic> jsonString = jsonDecode(json);
  // List<dynamic> collection = jsonString['collectionChartDataList'];
  // collection.forEach((e) => print(e));
  DataList list = DataList.fromJson(jsonDecode(json));
  print(jsonEncode(list.toJson()));
}
