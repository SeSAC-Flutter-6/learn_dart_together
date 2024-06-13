import 'unit.dart';

abstract interface class MagicUnit implements Unit {
  int get mp;

  int get maxMp;

  set mp(int value);

  void useMagic({Unit target});
}
