import 'custom_reg_exp.dart';

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

  for (String testCase in testCases) {
    if (customRegExp(testCase)) {
      print('$testCase: 매칭됨');
    } else {
      print('$testCase: 매칭되지 않음');
    }
  }
}
