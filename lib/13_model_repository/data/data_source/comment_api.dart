import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<dynamic>> fetchDataByPostId(int postId) async {
    try {
      final response = await http.get(
          Uri.parse('$_baseURL?postId=${postId.toString()}'));
      if (response.statusCode == 200) {
        final List<dynamic> commentListJson = jsonDecode(utf8.decode(response.bodyBytes));
        return commentListJson;
      } else {
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching comments: $error');
    }
  }
  
  Future<List<dynamic>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> commentListJson = jsonDecode(utf8.decode(response.bodyBytes));
        return commentListJson;
      } else {
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching comments: $error');
    }
  }
}
