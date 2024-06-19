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
// *문제점*
// 각 set의 내부 요소, 예를 들어 collectionSalePrice에 대하여 같은 함수를 실행해야 하는데, collectionSalePrice의 요소가 null인 경우에는 에러가 날 수 있다
// 그러므로 이 경우에는 함수를 실행하지 않아야 한다

  final collectionChartDataList = jsonDecode(json)['collectionChartDataList'];
  print(collectionChartDataList);
  collectionChartDataList
      .where((i) => i['collectionSalePrice'] != null)
      .forEach((e) {
    e['collectionSalePrice'].forEach((item) {
      print(item);
    });
  });
}
