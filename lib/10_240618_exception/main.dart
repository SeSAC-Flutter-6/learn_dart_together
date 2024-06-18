void main() {
  try {
    throw Exception('어쩌구');
  } catch (e) {
    print((e as Exception).toString());
  }
}

class InvalidMemoSelectException implements Exception {
  final String message;
  InvalidMemoSelectException(this.message);

  @override
  String toString() {
    return 'InvalidMemoSelectException :$message';
  }
}
