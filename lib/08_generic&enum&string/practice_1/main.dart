import 'strongbox.dart';
import 'keytype.dart';
import 'constants.dart';

void main() {
  StrongBox strongbox = StrongBox(keytype: Keytype.padlock);
  strongbox.put('Hello');

  for (var i = 0; i < padlockMaxCount + 1; i++) {
    print(strongbox.get());
  }
}
