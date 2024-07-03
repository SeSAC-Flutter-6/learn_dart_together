import 'package:http/http.dart' as http;

class DataSource {
  Future<List<User>> getUserData() async {
    final response = await http.get(Uri.parse('https://example.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

class User {
  int id;
  String name;
  String username;
  String address;
  String street;
  String suite;
  String city;
  String zipcode;
  String geo;
  String lat;
  String lng;
  int phone;
  String website;
  String company;

  User({
    required this.id,
    required this.username,
    required this.address,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.company,
  });


}