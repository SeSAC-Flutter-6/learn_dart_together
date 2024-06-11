import 'package:test/test.dart';
import 'package:learn_dart_together/05_240611_interface/book.dart';
import 'package:learn_dart_together/05_240611_interface/computer.dart';

void main() {
  test('책 무게 계산', () {
    Book book = Book(
      name: '요리책',
      price: 20,
      color: '파랭이',
      assetWeight: 1.5,
      isbn: '14422',
    );
    expect(book.weight, 1.5);
  });

  test('컴퓨터 무게도 되는지', () {
    Computer computer = Computer(
      name: '맥북',
      price: 2000,
      color: 'Silver',
      assetWeight: 2.0,
      makerName: 'Apple',
    );

    expect(computer.weight, 2.0);
  });
}
