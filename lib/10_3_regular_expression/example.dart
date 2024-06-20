// ignore_for_file: unused_local_variable

import 'dart:io';

void main() {
  /// 문제 1
  /// 1부터 100까지의 정수를 콤마로 연결하여 다음과 같은 문자열 str 을 생성하는 코드를 작성하시오
  /// 완성된 문자열 str 을 콤마를 구분자로 하여 String 리스트 numsString 에 대입하시오.
  String str =
      '${List.generate(100, (index) => (index + 1).toString()).join(',')},';
  List<String> numsString = str.split(RegExp(','));
  numsString.removeWhere((item) => item.isEmpty);

  ///문제 2
  /// 폴더명과 파일명을 매개변수로 받아서 연결한 파일 주소를 리턴하는 메서드를 작성하시오.
  /// 폴더명의 경우 마지막에 \ 기호가 붙어있는 경우도 있고 아닌 경우도 있으니 두 경우 모두 처리할 수 있도록 하시오.
  String path1 = getPath(Directory.current.path, 'abc.txt');
  String path2 = getPath(
      '/Users/seoyun/development/sesac_flutter/learn_dart_together', 'abc.txt');
  String path3 = getPath(
      '/Users/seoyun/development/sesac_flutter/learn_dart_together/',
      'abc.txt');

  ///문제 3
  ///다음 조건에 맞는 정규표현식을 작성하시오.
  /// 1. 모든 문자열
  RegExp pattern1 = RegExp(r'.*');

  /// 2. 최초 첫번째 문자는 A, 두 번째 문자는 숫자, 세 번째 문자는 숫자이거나 아무것도 없거나
  RegExp pattern2 = RegExp(r'^A\d\d?$');

  /// 3. 최초 첫번째 문자는 U, 2~4번째 문자는 영어 대문자
  RegExp pattern3 = RegExp(r'^U[A-Z]{2,4}$');
}

String getPath(String folder, String fileName) {
  String separator = Platform.isWindows ? '\\' : '/';

  if (!folder.endsWith(separator)) {
    folder += separator;
  }

  return folder + fileName;
}
