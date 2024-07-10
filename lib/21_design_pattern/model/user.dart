import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._(); // 이 줄을 추가합니다.

  const factory User({
    int? id,
    required String name,
    required String phone,
    required String address,
    DateTime? birthday,
    DateTime? createdAt,
  }) = _User;
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, address: $address, birthday: ${birthday != null ? '${birthday?.year}/${birthday?.month}/${birthday?.day}' : 'null'}, createdAt: ${createdAt != null ? '${createdAt?.year}/${createdAt?.month}/${createdAt?.day}' : 'null'})';
  }
}

extension UserCsvExtension on User {
  static User fromCsv(List<String> parts) {
    return User(
      id: int.parse(parts[0]),
      name: parts[1],
      phone: parts[2],
      address: parts[3],
      birthday: DateTime.tryParse(parts[4]),
      createdAt: DateTime.tryParse(parts[5]),
    );
  }

  String toCsv() {
    return '$id,$name,$phone,$address,$birthday,$createdAt';
  }
}
