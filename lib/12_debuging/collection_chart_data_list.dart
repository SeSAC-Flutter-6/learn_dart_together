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
      jsonDecoded['collectionChartDataList'];
  print(jsonDecoded['collectionChartDataList']);
  collectionChartDataList.forEach((i) {
    if (i.containsKey('collectionSalePrice') &&
        i['collectionSalePrice'] == null) {
      i['collectionSalePrice'] = [];
    }
  });
  print(collectionChartDataList);
}
