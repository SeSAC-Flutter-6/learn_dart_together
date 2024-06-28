class UserDto {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserDto(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
    phone = json["phone"];
    website = json["website"];
    company =
        json["company"] == null ? null : Company.fromJson(json["company"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["username"] = username;
    _data["email"] = email;
    if (address != null) {
      _data["address"] = address?.toJson();
    }
    _data["phone"] = phone;
    _data["website"] = website;
    if (company != null) {
      _data["company"] = company?.toJson();
    }
    return _data;
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    catchPhrase = json["catchPhrase"];
    bs = json["bs"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["catchPhrase"] = catchPhrase;
    _data["bs"] = bs;
    return _data;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json["street"];
    suite = json["suite"];
    city = json["city"];
    zipcode = json["zipcode"];
    geo = json["geo"] == null ? null : Geo.fromJson(json["geo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["street"] = street;
    _data["suite"] = suite;
    _data["city"] = city;
    _data["zipcode"] = zipcode;
    if (geo != null) {
      _data["geo"] = geo?.toJson();
    }
    return _data;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }
}
