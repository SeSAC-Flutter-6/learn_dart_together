String getPath(String path, String fileName) {
  return '${path.replaceAll(RegExp(r'\\$'), '')}\\$fileName';
}
