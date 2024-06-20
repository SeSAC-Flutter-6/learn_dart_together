String getPath(String path, String fileName) {
  if (!path.endsWith('\\')) {
    path += '\\';
  }
  return path + fileName;
}

void main() {
  String path = 'C:\\dev';
  String fileName = 'abc.txt';

  print(getPath(path, fileName)); // C:\dev\abc.txt
}
