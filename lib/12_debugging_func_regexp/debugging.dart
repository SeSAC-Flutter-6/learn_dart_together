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

  final jsonData = jsonDecode(json)['collectionChartDataList'] as List;
  final List<CollectionChartData> decoded =
      jsonData.map((data) => CollectionChartData.fromJson(data)).toList();

  print(decoded);

  // 데이터 값이 null인 경우 다른 데이터 값들과 형식이 달라 역직렬화 과정에서 fromJson 메서드를 공유할 수 없다.
  // 따라서 null인지 체크하여 null인 경우에 대한 처리를 따로 해야한다.
  // 해당 문제에서는 collectionSalePrice의 데이터 타입이 List이기 때문에 null일 경우 빈 배열을 할당하도록 했다.
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice> collectionSalePrice;

  CollectionChartData({
    required this.collectionName,
    required this.collectionSalePrice,
  });

  CollectionChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'],
        collectionSalePrice = (json['collectionSalePrice'] as List?)
                ?.map((e) => CollectionSalePrice.fromJson(e))
                .toList() ??
            []; // ***

  Map<String, dynamic> toJson() => {
        'collectionName': collectionName,
        'collectionSalePrice':
            collectionSalePrice.map((e) => e.toJson()).toList(),
      };
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;

  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'],
        cvtDatetime = DateTime.parse(json['cvtDatetime']);

  Map<String, dynamic> toJson() => {
        'price': price,
        'cvtDatetime': cvtDatetime.toIso8601String(),
      };
}
