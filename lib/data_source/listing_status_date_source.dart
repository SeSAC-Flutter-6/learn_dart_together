import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_data_source/listing_status.dart';

class ListingStatusDateSource {
  getListingStatus() async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));
    List<String> list = response.body.split('\n').skip(1).toList();
    final listSplit = list.map((e) => e.split(',').map((e)=>e.trim()).toList()).toList();
    return listSplit.map((e) => ListingStatus.fromCsv(e)).toList();
    for(int i = 0; i<100; i ++){
    print(listSplit[i]);}
  }
}

void main() async {
  final data = await ListingStatusDateSource().getListingStatus();
  // print(data);
}
