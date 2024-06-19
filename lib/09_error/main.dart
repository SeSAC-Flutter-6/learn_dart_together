void main() {
  try {
    // throw RangeError('RangeError');
    // throw Exception('어쩌구 저쩌구');
    throw InvalidMemoSelectException('RangeError');
  }catch (e) {
    print((e as Exception).toString());
  }
}
class InvalidMemoSelectException implements Exception {
  final String message;

  InvalidMemoSelectException(this.message);

  @override
  String toString() {
    return 'InvalidMemoSelectException : $message';
  }
}