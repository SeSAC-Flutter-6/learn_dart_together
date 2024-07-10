import 'dart:math';

import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/data_source/member_data_source.dart';
import 'package:learn_dart_together/20_design/model/member.dart';
import 'package:learn_dart_together/20_design/repository/member_repository.dart';

class MemberRepositoryImpl implements MemberRepository {
  final MemberDataSource _memberDataSource;
  final List<Member> _deletedMembers = [];

  MemberRepositoryImpl(this._memberDataSource);

  @override
  Future<Result<List<Member>, String>> getMember(
      {int? id, String? name}) async {
    try {
      final members = await _memberDataSource.getMember(id: id, name: name);
      return members.isEmpty
          ? Result.error('등록된 회원정보가 없습니다')
          : Result.success(members);
    } catch (e) {
      return Result.error('회원조회 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Member, String>> registerMember({
    required String name,
    required String address,
    required String phoneNumber,
    required DateTime birthDate,
  }) async {
    int id = (await _memberDataSource.getMember()).map((e) => e.id).reduce(max);
    try {
      final member = Member(
        id: ++id,
        name: name,
        address: address,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        registrationDate: DateTime.now(),
      );
      await _memberDataSource.addMember(member);
      return Result.success(member);
    } catch (e) {
      return Result.error('회원등록 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Member, String>> updateMember({
    required int id,
    String? name,
    String? address,
    String? phoneNumber,
    DateTime? birthDate,
  }) async {
    try {
      final updatedMember = await _memberDataSource.updateMember(
        id: id,
        name: name,
        address: address,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
      );
      return updatedMember != null
          ? Result.success(updatedMember)
          : Result.error('등록된 회원정보가 없습니다.');
    } catch (e) {
      return Result.error('회원수정 중 오류 발생:$e');
    }
  }

  @override
  Future<Result<Member, String>> deleteMember({required int id}) async {
    try {
      final deletedMember = await _memberDataSource.deleteMember(id: id);
      if (deletedMember != null) {
        _deletedMembers.add(deletedMember);
        return Result.success(deletedMember);
      }
      return Result.error('등록된 회원정보가 없습니다');
    } catch (e) {
      return Result.error('회원삭제 중 오류 발생: $e');
    }
  }

  @override
  Future<Result<Member, String>> undoDeleteMember() async {
    try {
      if (_deletedMembers.isNotEmpty) {
        final restoredMember = _deletedMembers.removeLast();
        _memberDataSource.addMember(restoredMember);
        return Result.success(restoredMember);
      }
      return Result.error('삭제한 회원정보가 없습니다.');
    } catch (e) {
      return Result.error('삭제취소 중 오류 발생: $e');
    }
  }

  @override
  Future<void> restoreMembers() async {
    await _memberDataSource.fetchMembers();
  }
}
