import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required DateTime registedData,
    required String address,
    required String phone,
    required DateTime birth,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.fromCsv(List<String> csv) => User(
        id: int.parse(csv[0]),
        name: csv[1],
        registedData: DateTime.parse(csv[2]),
        address: csv[3],
        phone: csv[4],
        birth: DateTime.parse(csv[5]),
      );
}
