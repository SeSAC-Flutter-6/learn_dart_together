import 'package:learn_dart_together/14_datasource/user/address.dart';
import 'package:learn_dart_together/14_datasource/user/company.dart';

class UserInfo {
  int id;
  String name;
  String username;
  Address address;
  String phone;
  String website;
  Company company;

  UserInfo({
    required this.id,
    required this.name,
    required this.username,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  UserInfo copyWith({
    int? id,
    String? name,
    String? username,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson(),
      };

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        address = Address.fromJson(json['address']),
        phone = json['phone'],
        website = json['website'],
        company = Company.fromJson(json['company']);

  @override
  String toString() =>
      'UserInfo(id: $id, name: $name, username: $username, address: $address, phone: $phone, website: $website, company: $company)';

  @override
  bool operator ==(covariant UserInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.username == username &&
        other.address == address &&
        other.phone == phone &&
        other.website == website &&
        other.company == company;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        company.hashCode;
  }
}
