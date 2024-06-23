class DataSource {
  Future<List<User>> getUserData

  async

  {

  final response = await
}}

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

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'username': username,
        'address': address,
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo,
        'lat': lat,
        'lng': lng,
        'phone': phone,
        'website': website,
        'company': company,

      };

  User.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    username = json['username'],
    address = json['address'],
    street = json['street'],
    suite = json['suite'],
    city = json['city'],
    zipcode = json['zipcode'],


}