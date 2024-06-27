import 'dart:convert';
import 'package:http/http.dart' as http;

class PostApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/posts';
  Future<Map<String, dynamic>> fetchDataById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseURL/${id.toString()}'));
      if (response.statusCode == 200) {
        final postListJson = jsonDecode(utf8.decode(response.bodyBytes));
        return postListJson;
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching posts: $error');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> postListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return postListJson.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching posts: $error');
    }
  }
}
