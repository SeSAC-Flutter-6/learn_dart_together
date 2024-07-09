import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required int id,
    required String name,
    required String address,
    required String phoneNumber,
    required DateTime birthDate,
    required DateTime registrationDate,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);

  factory Member.fromCsv(String csv) {
    final list = csv.split(',');
    return Member(
      id: int.tryParse(list[0]) ?? -1,
      name: list[1],
      address: list[2],
      phoneNumber: isValidPhoneNumber(list[3]) ? list[3] : '',
      birthDate: DateTime.tryParse(list[4]) ?? DateTime(0, 1, 1),
      registrationDate: DateTime.tryParse(list[5]) ?? DateTime(0, 1, 1),
    );
  }
}

extension Converter on Member {
  String toCsv() {
    return '$id,$name,$address,$phoneNumber,${birthDate.toString().substring(0, 10)},${registrationDate.toString().substring(0, 10)}';
  }

  String toInfo() {
    return 'Member(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, birthDate: ${birthDate.toString().substring(0, 10)}, registrationDate: ${registrationDate.toString().substring(0, 10)}';
  }
}
