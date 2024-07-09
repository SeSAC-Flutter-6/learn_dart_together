import 'dart:io';
import 'package:learn_dart_together/23_design_pattern/repository/user_repository.dart';
import 'package:learn_dart_together/23_design_pattern/model/user.dart';

class UserUI {
  final UserRepository userRepository;

  UserUI(this.userRepository);

  Future<void> userManagement() async {
    bool running = true;
    while (running) {
      printUserMenu();
      String? userInput = stdin.readLineSync()?.trim();

      switch (userInput) {
        case '1':
          await showUsers();
          break;
        case '2':
          await addUser();
          break;
        case '3':
          await deleteUser();
          break;
        case '4':
          running = false;
          break;
          case '5':
          await undoDeleteUser();
          break;

        default:
          print('올바른 옵션을 선택하세요.');
          break;
      }
    }
  }

  void printUserMenu() {
    print('======== 회원 관리 ========');
    print('1. 회원 목록');
    print('2. 회원 추가');
    print('3. 회원 삭제');
    print('4. 이전 메뉴로 돌아가기');
    print('5. 회원 삭제 취소');
    print('===========================');
    print('원하는 작업의 번호를 입력하세요.');
  }

  Future<void> showUsers() async {
    try {
      List<User> users = userRepository.getAllUsers();
      if (users.isEmpty) {
        print('등록된 회원이 없습니다.');
      } else {
        print('===== 사용자 목록 =====');
        users.forEach((user) {
          int age = calculateAge(user.birth);
          print('ID: ${user.id}, 이름: ${user.name}, 주소: ${user.address}, 나이: $age, 생일: ${formatDate(user.birth)}, 성별: ${genderToKorean(user.gender)}');
        });
        print('======================');
        await userRepository.saveUsers();
      print('사용자 목록이 CSV 파일에 저장되었습니다.');
      }
    } catch (e) {
      print('사용자 목록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> addUser() async {
    try {
      print('새 회원의 이름을 입력하세요:');
      String? name = stdin.readLineSync()?.trim();
      if (name == null || name.isEmpty) {
        print('이름을 입력해야 합니다.');
        return;
      }

      print('새 회원의 주소를 입력하세요:');
      String? address = stdin.readLineSync()?.trim();
      if (address == null || address.isEmpty) {
        print('주소를 입력해야 합니다.');
        return;
      }

      print('새 회원의 생일을 입력하세요 (YYYYMMDD):');
      String? birth = stdin.readLineSync()?.trim();
      if (birth == null || birth.isEmpty || birth.length != 8 || !isNumeric(birth)) {
        print('올바른 생일을 입력해야 합니다.');
        return;
      }

      int id = userRepository.generateUserId();
      String year = birth.substring(0, 4);
      String month = birth.substring(4, 6);
      String day = birth.substring(6, 8);

      print('새 회원의 성별을 입력하세요 (남 또는 여):');
      String? genderInput = stdin.readLineSync()?.trim().toLowerCase();
      Gender gender;
      if (genderInput == '남') {
        gender = Gender.male;
      } else if (genderInput == '여') {
        gender = Gender.female;
      } else {
        print('올바른 성별을 입력해야 합니다.');
        return;
      }

      User newUser = User(
        id: id,
        name: name,
        address: address,
        birth: DateTime(int.parse(year), int.parse(month), int.parse(day)),
        isMember: true,
        createdAt: DateTime.now(),
        loanBooks: [],
        gender: gender,
      );

      userRepository.addUser(newUser);
      await userRepository.saveUsers();
      print('회원이 추가되었습니다: ${newUser.name}');
    } catch (e) {
      print('회원 추가 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      print('삭제할 회원의 ID를 입력하세요:');
      String? idInput = stdin.readLineSync()?.trim();
      if (idInput == null || idInput.isEmpty || !isNumeric(idInput)) {
        print('올바른 회원 ID를 입력해야 합니다.');
        return;
      }

      int id = int.parse(idInput);
      User? userToDelete = userRepository.getUserById(id);
      if (userToDelete == null) {
        print('해당 ID의 회원을 찾을 수 없습니다.');
        return;
      }

      userRepository.deleteUser(id);
      await userRepository.saveUsers();
      print('회원이 삭제되었습니다: ${userToDelete.name}');
    } catch (e) {
      print('회원 삭제 중 오류가 발생했습니다: $e');
    }
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime(2024, 7, 8); // 2024년 기준
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  String formatDate(DateTime date) {
    return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
  }

  String genderToKorean(Gender gender) {
    return gender == Gender.male ? '남' : '여';
  }


 Future<void> undoDeleteUser() async {
    try {
      print('삭제를 취소할 회원의 ID를 입력하세요:');
      String? idInput = stdin.readLineSync()?.trim();
      if (idInput == null || idInput.isEmpty || !isNumeric(idInput)) {
        print('올바른 회원 ID를 입력해야 합니다.');
        return;
      }

      int id = int.parse(idInput);
      User? deletedUser = userRepository.undoDeleteUser(id);
      if (deletedUser == null) {
        print('삭제된 회원을 찾을 수 없습니다.');
        return;
      }

      await userRepository.saveUsers();
      print('회원 삭제가 취소되었습니다: ${deletedUser.name}');
    } catch (e) {
      print('회원 삭제 취소 중 오류가 발생했습니다: $e');
    }
  }
}