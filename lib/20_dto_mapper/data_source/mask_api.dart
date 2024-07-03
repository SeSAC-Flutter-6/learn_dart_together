import 'dart:convert';

import 'package:learn_dart_together/20_dto_mapper/dto/store_dto.dart';
import 'package:dio/dio.dart';

class MaskApi {
  final Dio _dio;

  MaskApi({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<StoreDto>> getMasks() async {
    final response = await _dio.get(
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json',
      options: Options(responseType: ResponseType.plain),
    );

    if (response.statusCode != 200) {
      throw Exception("오류발생");
    }

    // 응답 데이터를 String으로 변환한 후 JSON 디코딩
    final jsonMap = jsonDecode(response.data) as Map<String, dynamic>;
    final jsonList = jsonMap['stores'] as List;

    return jsonList.map((e) => StoreDto.fromJson(e)).toList();
  }
}
