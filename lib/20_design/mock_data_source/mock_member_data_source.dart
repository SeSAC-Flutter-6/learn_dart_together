import 'dart:io';
import 'package:learn_dart_together/20_design/data_source/member_data_source.dart';
import 'package:learn_dart_together/20_design/model/member.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class MockMemberDataSource implements MemberDataSource {
  final _file =
      '/Users/caliapark/Desktop/Practice/lib/20_design/mock_data_source/member_data.csv';

  @override
  Future<List<Member>> getMember({int? id, String? name}) async {
    try {
      final List<Member> members = await csvToList(_file);
      return members.where((member) {
        if (id != null) return member.id == id;
        if (name != null) return member.name == name;
        return true;
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addMember(Member member) async {
    await File(_file)
        .writeAsString('\n${member.toCsv()}', mode: FileMode.append);
  }

  @override
  Future<Member?> updateMember({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDate,
  }) async {
    final members = await getMember();
    final index = members.indexWhere((e) => e.id == id);

    if (index != -1) {
      final member = members[index];
      final updatedmember = member.copyWith(
        name: name ?? member.name,
        address: address ?? member.address,
        phoneNumber: phoneNumber ?? member.phoneNumber,
        birthDate: birthDate ?? member.birthDate,
      );
      members[index] = updatedmember;

      String content =
          'id,name,address,phoneNumber,birthDate,registrationDate\n';
      content += members.map((member) => member.toCsv()).join('\n');
      await File(_file).writeAsString(content);
      return updatedmember;
    }
    return null;
  }

  @override
  Future<Member?> deleteMember({required int id}) async {
    final members = await getMember();
    final index = members.indexWhere((e) => e.id == id);

    if (index != -1) {
      final member = members[index];
      members.removeAt(index);

      String content =
          'id,name,address,phoneNumber,birthDate,registrationDate\n';
      content += members.map((member) => member.toCsv()).join('\n');
      await File(_file).writeAsString(content);
      return member;
    }
    return null;
  }
}
