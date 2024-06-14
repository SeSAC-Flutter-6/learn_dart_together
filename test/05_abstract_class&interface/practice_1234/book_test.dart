import 'package:test/test.dart';
import 'package:learn_dart_together/05_abstract_class&interface/practice_1234/book.dart';
import 'package:learn_dart_together/05_abstract_class&interface/practice_1234/constants.dart';

void main() {
  group('book 테스트', () {
    late Book book;

    setUp(() {
      book = Book(
        name: initialName,
        price: initialPrice,
        color: initialColor,
        weight: initialWeight,
        isbn: initialIsbn,
      );
    });
    test('weight 초기값(50) get 테스트', () {
      expect(book.getWeight, initialWeight);
    });
    test('weight set 테스트', () {
      book.setWeight = 200;
      expect(book.getWeight, 200);
    });
    test('생성자 때 wegith에 음수 입력시 에러 발생', () {
      expect(
          () => Book(
                name: initialName,
                price: initialPrice,
                color: initialColor,
                weight: -1,
                isbn: initialIsbn,
              ),
          throwsException);
    });
    test('weight set 음수 입력시 에러 발생', () {
      expect(() => book.setWeight = -1, throwsException);
      expect(() => book.setWeight = 0, throwsException);
      expect(() => book.setWeight = 1, returnsNormally);
    });
  });
}
