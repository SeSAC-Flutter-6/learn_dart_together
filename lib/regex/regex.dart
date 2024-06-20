void main() {
  // 연습문제1

  // 1부터 100까지의 정수를 콤마로 연결하여 문자열 생성
  String str = '${List.generate(100, (index) => (index + 1).toString()).join(',')},';
  print('생성된 문자열: $str');

  // 정규 표현식을 사용하여 문자열을 콤마를 구분자로 분리하여 리스트로 변환
  List<String> numsString = str.split(RegExp(r','));

  // 마지막 빈 문자열 요소 제거
  numsString = numsString.where((element) => element.isNotEmpty).toList();
  print('분리된 문자열 리스트: $numsString');

  // 연습문제2
  String getPath(String path, String fileName) {
    // 폴더명 마지막에 \가 있는지 확인하고, 없으면 추가
    final normalizedPath = '${path.replaceAll(RegExp(r'\\+$'), '')}\\';
    // 폴더명과 파일명을 연결하여 파일 주소 반환
    return normalizedPath + fileName;
  }

  // 사용 예시
  print(getPath('C:\\dev', 'abc.txt'));   // 출력: C:\dev\abc.txt
  print(getPath('C:\\dev\\', 'abc.txt')); // 출력: C:\dev\abc.txt

  // 연습문제3
  final regex = RegExp(r'^(A\d\d?|(U[A-Z]{2,3})).*$');

  List<String> testStrings = [
    "A12",
    "A1",
    "UABC",
    "UA",
    "AB12",
    "A123",
    "UBC",
    "UABCD",
    "UAB",
    "A",
    "U",
  ];

  for (var test in testStrings) {
    if (regex.hasMatch(test)) {
      print('$test: 매칭됨');
    } else {
      print('$test: 매칭되지 않음');
    }
  }

}
