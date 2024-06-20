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
  final jsonDecoded = jsonDecode(json);
  // List<Map<String, dynamic>> collectionChartDataList = jsonDecoded['collectionChartDataList']; // dynamic 안되는 이유: null
  List<dynamic> collectionChartDataList =
      jsonDecoded['collectionChartDataList'] as List; // 타입 캐스팅 하거나 앞에 차입 명시 해주면
  final collectionChartDataListMap =
      collectionChartDataList.map((e) => e as Map<String, dynamic>);
  print(jsonDecoded['collectionChartDataList']);
  collectionChartDataListMap.toList().forEach((i) {
    if (i.containsKey('collectionSalePrice') &&
        i['collectionSalePrice'] == null) {
      i['collectionSalePrice'] = [];
    }
  });
  print(collectionChartDataList);
}
