import 'unit.dart';

abstract class MagicUnit extends Unit {
  int get mp;

  int get maxMp;

  set mp(int value);

  void useMagic({Unit target});
}
