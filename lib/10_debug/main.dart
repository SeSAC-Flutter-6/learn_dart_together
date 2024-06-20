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

class CollectionChartDataListContainer {
  List<CollectionChartDataList> collectionChartDataList;

  CollectionChartDataListContainer({
    required this.collectionChartDataList,
  });

  CollectionChartDataListContainer.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List<dynamic>)
      .map((e) => CollectionChartDataList.fromJson(e as Map<String, dynamic>))
      .toList();
}

class CollectionChartDataList {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;

  CollectionChartDataList({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  // collectionSalePrice 리스트가 null일 수 있음을 고려한 json parse 로직
  // null이 아닐 경우 List<dynamic>으로 캐스팅하여 리스트를 map 함수로 순회하여 요소를 CollectionSalePrice.fromJson 생성자를 통해 List<CollectionSalePrice>가 되도록 만듬
  // null일 경우 삼항연산자의 마지막 항에서 null 할당.
  CollectionChartDataList.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = json['collectionSalePrice'] != null
            ? (json['collectionSalePrice'] as List<dynamic>)
            .map((e) => CollectionSalePrice.fromJson(e as Map<String, dynamic>))
            .toList()
            : null;
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = (json['price'] as num).toDouble(),
        cvtDatetime = DateTime.parse(json['cvtDatetime']);
}

void main() {
  final Map<String, dynamic> decodedJson = jsonDecode(json);
  final list = CollectionChartDataListContainer.fromJson(decodedJson);
  print(list.collectionChartDataList.length);
}
