import 'dart:convert';
import 'package:http/http.dart' as http;

class AlbumApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Map<String, dynamic>>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> albumListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return albumListJson.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load albums: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching albums: $error');
    }
  }
}
