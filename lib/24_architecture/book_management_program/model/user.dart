import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {

  const User._();
  const factory User({
    required int id,
    required String registrationDate,
    required String name,
    required String address,
    required String phoneNumber,
    required String birthday,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  int get age => DateTime.now().year - int.parse(birthday.split('/')[0]);

  factory User.fromList(List<dynamic> list) {
    return User(
      id: list[0],
      registrationDate: list[1],
      name: list[2],
      address: list[3],
      phoneNumber: list[4],
      birthday: list[5],
    );
  }
}