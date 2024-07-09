import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/21_design/data/model/user.dart';

// final String jsonString = '''[
//     {
//       "id": 1,
//       "name": "한석봉",
//       "address": "서울 중구 신당동",
//       "gender": "male"
//     },
//     {
//       "id": 2,
//       "name": "김석봉",
//       "address": "서울 중구 당동",
//       "gender": "male"
//     },
//     {
//       "id": 3,
//       "name": "한채이",
//       "address": "서울 강서구 신월동",
//       "gender": "female"
//     }
//   ]''';
// // JSON 문자열을 List로 변환
// List<String> jsonList = jsonDecode(jsonString);

class UsersApi {
  Future<List<dynamic>> loadUsersFromFile(String filePath) async {
    // 파일 내용 읽기
    final file = File(filePath);
    final contents = await file.readAsString();

    // Json 파싱
    List<dynamic> jsonUserStringList = jsonDecode(contents);

    return jsonUserStringList;
    //Json을 User 객체 리스트로 변환
  }

  Future<void> updateUsersFromFile(
      String filePath, List<User> updatedUserList) async {
    final file = File(filePath);

    // 기존 데이터에 새로운 책 추가
    final jsonList = updatedUserList.map((e) => e.toJson()).toList();

    // 파일에 새로운 데이터 쓰기
    await file.writeAsString(jsonEncode(jsonList), mode: FileMode.write);
  }
}