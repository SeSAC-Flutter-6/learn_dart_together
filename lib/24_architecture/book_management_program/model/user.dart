import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {

  const User._();
  const factory User({
    required int id,
    required int registrationDate,
    required String name,
    required String address,
    required String phoneNumber,
    required DateTime birthday,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  int get age => DateTime.now().year - birthday.year;
}