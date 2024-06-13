// deep Copy를 지원할 경우 Copyable 인터페이스를 활용하여 copyWith 메서드를 구현하세요.
abstract interface class Copyable<T> {
  T copyWith();
}