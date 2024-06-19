class FormatException implements Exception {
  final String? _message;
  FormatException(this._message);

  @override
  String toString() {
    if (_message == null) {
      return 'FormatException';
    }
    return 'FormatException: $_message';
  }
}
