import 'dart:convert';

import 'package:learn_dart_together/20_result/practice2/data_source/photo_data_source.dart';
import 'package:http/http.dart' as http;
import '../dto/photo_dto.dart';

class PhotoDataSourceImpl implements PhotoDataSource {
  final String _baseUrl;
  final String _key = '44773569-d524c8c91a6f308c696d1df1a';

  PhotoDataSourceImpl({String? baseUrl, String? key})
      : _baseUrl = baseUrl ?? 'https://pixabay.com/api/';

  @override
  Future<List<PhotoDto>> getPhoto(String query) async {
    try {
      final http.Response response = await http
          .get(Uri.parse('$_baseUrl?key=$_key&q=$query&image_type=photo'));
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(response.body)['hits'];
        return jsonList.map((json) => PhotoDto.fromJson(json)).toList();
      }
      throw Exception('${response.statusCode}');
    } catch (error) {
      throw Exception('$error');
    }
  }
}
