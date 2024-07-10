import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/member.dart';

abstract interface class MemberRepository {
  Future<Result<List<Member>, String>> getMember({int? id, String? name});

  Future<Result<Member, String>> registerMember({
    required String name,
    required String address,
    required String phoneNumber,
    required DateTime birthDate,
  });

  Future<Result<Member, String>> updateMember({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDate,
  });

  Future<Result<Member, String>> deleteMember({required int id});

  Future<Result<Member, String>> undoDeleteMember();

  Future<void> restoreMembers();
}
