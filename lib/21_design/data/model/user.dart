import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_dart_together/21_design/data/model/gender.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String address,
    required Gender gender,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
