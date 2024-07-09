import 'package:learn_dart_together/20_design/model/member.dart';

abstract interface class MemberDataSource {
  Future<List<Member>> getMember({int? id, String? name});

  Future<void> addMember(Member member);

  Future<Member?> updateMember({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDate,
  });

  Future<Member?> deleteMember({required int id});
}
