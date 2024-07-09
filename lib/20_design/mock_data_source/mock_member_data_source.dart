import 'dart:io';
import 'package:learn_dart_together/20_design/data_source/member_data_source.dart';
import 'package:learn_dart_together/20_design/model/member.dart';
import 'package:learn_dart_together/20_design/utils/constant.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class MockMemberDataSource implements MemberDataSource {
  List<Member>? _members;
  final String _csvFile = memberCsvFile;
  late Future<void> _initializationDone;

  MockMemberDataSource() {
    _initializationDone = _initMembers();
  }

  Future<void> _initMembers() async {
    try {
      _members = await csvToMemberList(_csvFile);
    } catch (e) {
      print('회원 데이터 불러오기 실패: $e');
      _members = [];
    }
  }

  @override
  Future<List<Member>> getMember({int? id, String? name}) async {
    await _initializationDone;
    if (_members == null) {
      throw Exception('회원 데이터 초기화 실패');
    }
    if (id != null) {
      return _members!.where((member) => member.id == id).toList();
    } else if (name != null) {
      return _members!
          .where((member) =>
              member.name.toLowerCase().contains(name.toLowerCase()))
          .toList();
    }
    return _members!;
  }

  @override
  Future<void> addMember(Member member) async {
    await _initializationDone;
    _members?.add(member);
    await _saveMembersToCSV();
  }

  @override
  Future<Member?> updateMember({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDate,
  }) async {
    await _initializationDone;
    if (_members == null) return null;

    final index = _members!.indexWhere((member) => member.id == id);
    if (index != -1) {
      final member = _members![index];
      final updatedMember = member.copyWith(
        name: name ?? member.name,
        address: address ?? member.address,
        phoneNumber: phoneNumber ?? member.phoneNumber,
        birthDate: birthDate ?? member.birthDate,
      );
      _members![index] = updatedMember;
      await _saveMembersToCSV();
      return updatedMember;
    }
    return null;
  }

  @override
  Future<Member?> deleteMember({required int id}) async {
    await _initializationDone;
    if (_members == null) return null;

    final index = _members!.indexWhere((member) => member.id == id);
    if (index != -1) {
      final deletedMember = _members!.removeAt(index);
      await _saveMembersToCSV();
      return deletedMember;
    }
    return null;
  }

  Future<void> _saveMembersToCSV() async {
    if (_members == null) return;
    final csvContent = [
      'id,name,address,phoneNumber,birthDate,registrationDate',
      ..._members!.map((member) =>
          '${member.id},${member.name},${member.address},${member.phoneNumber},${member.birthDate.toString().substring(0, 10)},${member.registrationDate.toString().substring(0, 10)}')
    ].join('\n');
    await File(_csvFile).writeAsString(csvContent);
  }
}
