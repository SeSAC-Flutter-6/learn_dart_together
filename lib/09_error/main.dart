import 'package:learn_dart_together/01_instance_class/hero.dart';

void main() {
  // throw InvalidMemoSelectException('어쩌구');
  try {
    // throw Exception('어쩌구 저쩌구');
    throw InvalidMemoSelectException('어쩌구');
  } catch (e) {
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