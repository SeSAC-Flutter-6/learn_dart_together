void main() {
  print(isValidPlayerName('A1234567'));
  print(isValidPlayerName('A123456791918'));
  print(isValidPlayerName('A1234A'));
  print(isValidPlayerName('A1234567A'));
}

bool isValidPlayerName(String name) {
  return RegExp(r'[A-Z][A-Z0-9]{7}').hasMatch(name);
}
