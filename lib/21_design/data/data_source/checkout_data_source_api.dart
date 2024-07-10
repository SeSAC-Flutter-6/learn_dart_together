import 'dart:convert';
import 'dart:io';

import '../model/checkout.dart';

class CheckOutApi {
  Future<List<dynamic>> loadCheckoutFromFile(String filePath) async {
    // 파일 내용 읽기
    final file = File(filePath);
    final contents = await file.readAsString();

    // Json 파싱
    List<dynamic> jsonCheckoutStringList = jsonDecode(contents);

    return jsonCheckoutStringList;
    //Json을 User 객체 리스트로 변환
  }

  Future<void> updateCheckoutFromFile(
      String filePath, List<CheckOut> updatedCheckoutList) async {
    final file = File(filePath);

    // 기존 데이터에 새로운 책 추가
    final jsonList = updatedCheckoutList.map((e) => e.toJson()).toList();

    // 파일에 새로운 데이터 쓰기
    await file.writeAsString(jsonEncode(jsonList), mode: FileMode.write);
  }
}