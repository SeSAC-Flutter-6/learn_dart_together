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
//salesPrice가 null인 경우에, 다음 반복문으로 넘어감

  final jsonData = jsonDecode(jsonStr);

  Iterable<dynamic> chartDataList = jsonData['collectionChartDataList'];
  print('chartDataList는 $chartDataList');
  chartDataList.forEach((data) {
    String collectionName = data['collectionName'];
    dynamic salePrices = data['collectionSalePrice'];

    if (salePrices == null) {
      return;
    }

    if (salePrices is List) {
      for (var priceData in salePrices) {
        double price = priceData['price'];
        String cvtDatetime = priceData['cvtDatetime'];
        print('Collection $collectionName: Price $price at $cvtDatetime');
      }
    }
  });
}
