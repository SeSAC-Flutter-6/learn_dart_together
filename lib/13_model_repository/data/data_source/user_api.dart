import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/users';
  Future<List<dynamic>> fetchAllData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List<dynamic> userListJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        return userListJson;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching users: $error');
    }
  }
}
