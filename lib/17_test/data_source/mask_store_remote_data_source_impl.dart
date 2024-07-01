import 'dart:convert';

import 'package:learn_dart_together/17_test/data_source/mask_store_data_source.dart';

import 'package:http/http.dart' as http;

import '../dto/mask_store_dto.dart';

class MaskStoreRemoteDataSourceImpl implements MaskStoreDataSource {
  @override
  Future<List<StoreDto>> getStores(num lat, num lng) async {
    final http.Response response = await http.get(Uri.parse(
        'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json'));

    final List jsonList = jsonDecode(response.body)['stores'];
    return jsonList.map((e) => StoreDto.fromJson(e)).toList();
  }
}
