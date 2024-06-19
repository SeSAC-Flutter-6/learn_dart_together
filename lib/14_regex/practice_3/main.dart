void main() {
  List<String> testCases = [
    'A12',
    'A1',
    'UABC',
    'UA',
    'UAB',
    'A',
    'U',
    'B12',
    'UABCD',
    'A123'
  ];

  RegExp regExp = RegExp(r'^(A\d{1,2}|U[A-Z]{2,4}).*$');

  for (String testCase in testCases) {
    if (regExp.hasMatch(testCase)) {
      print('$testCase: 매칭됨');
    } else {
      print('$testCase: 매칭되지 않음');
    }
  }
}
