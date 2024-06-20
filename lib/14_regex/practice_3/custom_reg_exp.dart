bool customRegExp(String testCase) {
  return RegExp(r'^(A\d{1,2}|U[A-Z]{3}).*$').hasMatch(testCase);
}
