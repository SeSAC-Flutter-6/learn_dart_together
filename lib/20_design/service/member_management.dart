import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/member.dart';
import 'package:learn_dart_together/20_design/service/my_library.dart';
import 'package:learn_dart_together/20_design/repository/member_repository.dart';
import '../utils/function.dart';

class MemberManagement {
  final MyLibrary _myLibrary;
  final MemberRepository _memberRepository;

  MemberManagement(this._myLibrary, this._memberRepository);

  Future<void> manageMember() async {
    while (true) {
      final input = validateInput(
          '0. 뒤로   1. 회원조회   2. 회원검색   3. 회원등록   4. 회원수정   5. 회원삭제   6.삭제취소');
      if (input == null) continue;

      switch (input) {
        case '0':
          _myLibrary.displayMain();
          return;
        case '1':
          await getMembers();
          break;
        case '2':
          await searchMember();
          break;
        case '3':
          await registerMember();
          break;
        case '4':
          await updateMember();
          break;
        case '5':
          await deleteMember();
          break;
        case '6':
          await undoDeleteMember();
          break;
        default:
          print('잘못된 입력: 숫자(0~6)를 입력하세요.');
          break;
      }
    }
  }

  Future<void> getMembers() async {
    final members = await _memberRepository.getMember();
    switch (members) {
      case Success():
        final input = validateInput('1. 이름순   2. 가입날짜순');
        if (input == null) return;

        final memberList = members.data;
        switch (input) {
          case '1':
            memberList.sort((a, b) => a.name.compareTo(b.name));
          case '2':
            memberList.sort(
                (a, b) => a.registrationDate.compareTo(b.registrationDate));
          default:
            print('잘못된 입력: 숫자(1~2)를 입력하세요.');
            return;
        }
        memberList.forEach((member) => print(member.toInfo()));
        break;
      case Error():
        print(members.error);
        break;
    }
  }

  Future<void> searchMember() async {
    final input = validateInput('검색할 회원 ID 또는 이름을 입력하세요.');
    if (input == null) return;

    final id = int.tryParse(input);
    final members = await _memberRepository.getMember(id: id, name: input);
    switch (members) {
      case Success():
        members.data.forEach((member) => print(member.toInfo()));
      case Error():
        print(members.error);
    }
  }

  Future<void> registerMember() async {
    final input = validateInput(
        '등록할 회원 이름, 주소, 연락처, 생일을 아래와 같이 입력하세요.\n박주현/서울시 영등포구/010-1234-5678/1998-12-15');
    if (input == null) return;

    final list = input.split('/');
    if (list.length != 4 ||
        !isValidPhoneNumber(list[2]) ||
        !isValidDate(list[3])) {
      print('잘못된 입력: 예시 형식과 동일하게 입력하세요.');
      return;
    }
    final member = await _memberRepository.registerMember(
      name: list[0],
      address: list[1],
      phoneNumber: list[2],
      birthDate: DateTime.parse(list[3]),
    );
    _printResult(member, '회원정보를 등록했습니다.');
  }

  Future<void> updateMember() async {
    final id = validateId('수정할 회원 ID를 입력하세요.');
    if (id == null) return;

    final input = validateInput(
        '수정할 회원 이름, 주소, 연락처, 생일을 아래와 같이 입력하세요. 기존 정보를 유지하고 싶은 항목은 * 입력\n김주현/*/010-1111-1111/*');
    if (input == null) return;

    final list = input.split('/');
    if (list.length != 4 ||
        (list[2] != '*' && !isValidPhoneNumber(list[2])) ||
        (list[3] != '*' && !isValidDate(list[3]))) {
      print('잘못된 입력: 예시 형식과 동일하게 입력하세요.');
      return;
    }
    final member = await _memberRepository.updateMember(
      id: id,
      name: list[0] == '*' ? null : list[0],
      address: list[1] == '*' ? null : list[1],
      phoneNumber: list[2] == '*' ? null : list[2],
      birthDate: list[3] == '*' ? null : DateTime.parse(list[3]),
    );
    _printResult(member, '회원정보를 수정했습니다.');
  }

  Future<void> deleteMember() async {
    final id = validateId('삭제할 회원 ID를 입력하세요.');
    if (id == null) return;

    final member = await _memberRepository.deleteMember(id: id);
    _printResult(member, '회원정보를 삭제했습니다.');
  }

  Future<void> undoDeleteMember() async {
    final result = await _memberRepository.undoDeleteMember();
    _printResult(result, '회원정보를 복원했습니다.');
  }
}

void _printResult(Result<Member, String> result, String message) {
  switch (result) {
    case Success():
      print('${result.data.toInfo()} $message');
      break;
    case Error():
      print(result.error);
      break;
  }
}
