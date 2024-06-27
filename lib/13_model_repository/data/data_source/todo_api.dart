import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/todos';
  Future<List<Map<String, dynamic>>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> todoListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return todoListJson.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load todos: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching todos: $error');
    }
  }
}
