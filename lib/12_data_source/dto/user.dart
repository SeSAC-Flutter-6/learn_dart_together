class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'],
        address = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company = Company.fromJson(json['company']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'username': username, 'email': email, 'address': address.toJson(), 'phone': phone, 'website': website, 'company': company.toJson()};

  @override
  int get hashCode => Object.hash(id, name, username, email, address, phone, website, company);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              username == other.username &&
              email == other.email &&
              address == other.address &&
              phone == other.phone &&
              website == other.website &&
              company == other.company;

  @override
  String toString() =>
      'User${this.toJson()}';

  User copyWith(int? id, String? name, String? username, String? email, Address? address, String? phone, String? website, Company? company) =>
      User(id: id ?? this.id, name: name ?? this.name, username: username ?? this.username, email: email ?? this.email, address: address ?? this.address, phone: phone ?? this.phone, website: website ?? this.website, company: company ?? this.company);
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  double lat;
  double lng;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'],
        lat = double.parse(json['geo']['lat']),
        lng = double.parse(json['geo']['lng']);

  Map<String, dynamic> toJson() =>
      {'street': street, 'suite': suite, 'city': city, 'zipcode': zipcode, 'lat': lat, 'lng': lng};

  @override
  int get hashCode => Object.hash(street, suite, city, zipcode, lat, lng);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Address &&
              runtimeType == other.runtimeType &&
              street == other.street &&
              suite == other.suite &&
              city == other.city &&
              zipcode == other.zipcode &&
              lat == other.lat &&
              lng == other.lng;

  @override
  String toString() =>
      'Address${this.toJson()}';

  Address copyWith(String? street, String? suite, String? city, String? zipcode, double? lat, double? lng) =>
      Address(street: street ?? this.street, suite: suite ?? this.suite, city: city ?? this.city, zipcode: zipcode ?? this.zipcode, lat: lat ?? this.lat, lng: lng ?? this.lng);
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        catchPhrase = json['catchPhrase'],
        bs = json['bs'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};

  @override
  int get hashCode => Object.hash(name, catchPhrase, bs);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Company &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              catchPhrase == other.catchPhrase &&
              bs == other.bs;

  @override
  String toString() =>
      'Company${this.toJson()}';

  Company coptyWith(String? name, String? catchPhrase, String? bs) =>
      Company(name: name ?? this.name, catchPhrase: catchPhrase ?? this.catchPhrase, bs: bs ?? this.bs);
}