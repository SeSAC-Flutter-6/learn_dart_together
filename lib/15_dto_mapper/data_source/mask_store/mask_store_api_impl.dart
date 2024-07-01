import 'dart:convert';

import 'package:learn_dart_together/15_dto_mapper/data_source/mask_store/mask_store_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/mask_store_dto/mask_store_dto.dart';
import 'package:http/http.dart' as http;

class MaskStoreApiImpl implements MaskStoreApi {
  static final _baseURL =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/';
  @override
  Future<List<MaskStoreDto>> getStores({double? lat, double? lng}) async {
    try {
      final response = await http.get(Uri.parse('${_baseURL}mask_store.json'));
      if (response.statusCode == 200) {
        final jsonList =
            jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        final storeJsonList = jsonList['stores'] as List<dynamic>;

        return storeJsonList
            .map((e) => MaskStoreDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load mask stores: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching mask stores: $error');
    }
  }
}
