String getPath(String path, String fileName) {
  return (RegExp(r'\\$').hasMatch(path)) ? path + fileName : '$path\\$fileName';
}


