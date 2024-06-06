class Hero {
  static int money = 100;
  String _name;
  final int _hp;

  String get name => _name;

  set name(String value) {
    if (value.length <= 1) {
      throw Exception('이름이 너무 짧습니다.');
    }
    if (value.length >= 8) {
      throw Exception('이름이 너무 깁니다.');
    }

    _name = value;
  }

  Hero(this._name, int hp) : _hp = hp;

  void _die() {
    print('죽었다');
  }
}
