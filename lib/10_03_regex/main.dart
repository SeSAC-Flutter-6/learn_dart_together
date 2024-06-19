import 'dart:io';

void main() {
  final String numbers = List.generate(100, (index) => '${index + 1}').reduce((e, v) => e + ',${v}');
  final List<String> numString = numbers.split(RegExp(r'[.*,]'));

  numString.forEach((e) => stdout.write('$e '));
  print('');

  String getPath(String path, String fileName) {
    final absolutePath = path.replaceAll(RegExp(r'[.*\\]'), '');
    return absolutePath + '\\' + fileName;
  }
  
  print(getPath('C:\dev', 'abs.txt'));

  // 모든 문자열
  // RegExp(r'[.*]')

  // 최초 첫번째 문자는 A, 두 번째 문자는 숫자, 세 번째 문자는 숫자이거나 아무것도 없거나
  // RegExp(r'^A\d\d?$')

  // 최초 첫번째 문자는 U, 2~4번째 문자는 영어 대문자
  // RegExp(r'^U[A-Z]{3}$')

  // ^는 문자열의 시작, $는 문자열의 끝을 나타냄
}