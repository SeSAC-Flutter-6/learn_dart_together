import 'keytype.dart';
import 'constants.dart';

class Strongbox<E> {
  E? _item;
  final Keytype _keytype;
  int _count;

  Strongbox({required Keytype keytype})
      : _keytype = keytype,
        _count = 0 {
    switch (_keytype) {
      case Keytype.padlock:
        _count = padlockMaxCount;
      case Keytype.button:
        _count = buttonMaxCount;
      case Keytype.dial:
        _count = dialMaxCount;
      case Keytype.finger:
        _count = fingerMaxCount;
    }
  }

  void put(E item) {
    _item = item;
  }

  E? get() {
    if (_count > 0) {
      _count--;
      return null;
    } else {
      return _item;
    }
  }
}
