import 'dart:convert';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api.dart';
import 'package:learn_dart_together/17_result_pattern/data/dto/photo_dto/photo_dto.dart';
import 'package:http/http.dart' as http;

class PhotoApiImpl implements PhotoApi {
  final String _baseUrl;
  final String _apiKey = '44773140-3d6706283cb2cbbb73cf741f4';
  const PhotoApiImpl({String? baseUrl})
      : _baseUrl = baseUrl ?? 'https://pixabay.com/api/';

  @override
  Future<List<PhotoDto>> searchPhotos(
      {required String firstKeyword, String? secondKeyword}) async {
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl?key=$_apiKey&q=$firstKeyword+$secondKeyword&image_type=photo'));
      if (response.statusCode == 200) {
        final List jsonList =
            jsonDecode(utf8.decode(response.bodyBytes))['hits'];
        return jsonList
            .map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }
}
