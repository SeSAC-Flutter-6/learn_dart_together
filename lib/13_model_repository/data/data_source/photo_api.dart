import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Map<String, dynamic>>> fetchDataByAlbumId(int albumId) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseURL?albumId=${albumId.toString()}'));
      if (response.statusCode == 200) {
        final List<dynamic> photoListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return photoListJson.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching photos: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> photoListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return photoListJson.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching photos: $error');
    }
  }
}
