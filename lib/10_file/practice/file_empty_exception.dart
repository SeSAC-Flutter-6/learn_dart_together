class FileEmptyException implements Exception {
  final String _message;
  FileEmptyException(String message) : _message = message;

  @override
  String toString() => 'FileEmptyException: $_message';
}
