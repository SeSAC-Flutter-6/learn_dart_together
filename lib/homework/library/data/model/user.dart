import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String name,
    required String address,
    required String phoneNumber,
    required String birthday,
    required String joinedDate,
  }) = _User;

  factory User.fromCsv(List<dynamic> csv) {
    return User(
      id: csv[0],
      name: csv[1],
      address: csv[2],
      phoneNumber: csv[3],
      birthday: csv[4],
      joinedDate: csv[5],
    );
  }

  List<String> toCsv() {
    return [
      id.toString(),
      name,
      address,
      phoneNumber,
      birthday,
      joinedDate,
    ];
  }

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
