void main() {
  print(getPath('C:/dev', 'abc.txt'));
  RegExp word1 = RegExp(r'.*');
  RegExp word2 = RegExp(r'A\d\d?');
  RegExp word3 = RegExp(r'U[A-Z]{2,4}');
}

String getPath(String path, String fileName) {
  String filePath = '';
  if (RegExp(r'.*/$').hasMatch(path)) {
    filePath = '$path$fileName';
  } else {
    filePath = '$path/$fileName';
  }
  return filePath;
}
