String getPath(String path, String fileName) {
  final buffer = StringBuffer('');

  buffer.write(path.endsWith('\\') ? path : '$path\\');
  buffer.write(fileName);

  return buffer.toString();
}