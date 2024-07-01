import 'dart:convert';
import 'package:learn_dart_together/17_dto/dto/store_dto.dart';
import 'package:http/http.dart' as http;

abstract interface class StoreDataSource {
  Future<List<StoreDto>> getStores();
}

class StoreDataSourceImpl implements StoreDataSource {
  @override
  Future<List<StoreDto>> getStores() async {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json'));
    final List jsonList = jsonDecode(response.body)['stores'];
    return jsonList.map((e) => StoreDto.fromJson(e)).toList();
  }
}
