abstract interface class Human {
  void speack();
}

class Man implements Human {
  @override
  void speack() {
    print('남자가 말합니다');
  }
}
