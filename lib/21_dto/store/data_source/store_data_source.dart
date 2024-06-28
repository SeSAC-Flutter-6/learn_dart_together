import 'dart:convert';

import '../dto/store_dto.dart';
import 'package:http/http.dart' as http;

class StoreDataSource {
  Future<List<Stores>> getStoreDto() async {
    final response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json'));
    final data = jsonDecode(response.body)['stores'] as List;
    return data.map((e) => Stores.fromJson(e)).toList();
  }
}
