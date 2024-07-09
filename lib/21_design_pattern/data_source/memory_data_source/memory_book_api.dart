import 'package:learn_dart_together/21_design_pattern/data_source/book_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/utils/csv_utils.dart';

class MemoryBookApi implements BookDataSource {
  final String csvFilePath = './assets/books.csv';

  @override
  Future<List<Book>> getBooks() async {
    final csvData = await readCsvFile(csvFilePath);
    return csvData.map((line) => BookCsvExtension.fromCsv(line)).toList();
  }

  @override
  Future<Book> getBook(int id) async {
    List<Book> books = await getBooks();
    return books.firstWhere((book) => book.id == id);
  }

  @override
  Future<Book> createBook(Book book) async {
    List<Book> books = await getBooks();

    Book newBook = Book(
      id: books.isNotEmpty ? books.last.id! + 1 : 1,
      title: book.title,
      author: book.author,
      isbn: book.isbn,
      publishedDate: book.publishedDate,
    );

    books.add(newBook);
    List<String> csvData = books.map((book) => book.toCsv()).toList();
    await writeCsvFile(csvFilePath, csvData);
    return newBook;
  }

  @override
  Future<Book> deleteBook(int id) async {
    List<Book> books = await getBooks();
    Book bookToDelete = books.firstWhere((book) => book.id == id);
    books.removeWhere((book) => book.id == id);

    await writeCsvFile(csvFilePath, books.map((book) => book.toCsv()).toList());
    return bookToDelete;
  }

  @override
  Future<Book> updateBook(Book book) async {
    List<Book> books = await getBooks();
    int index = books.indexWhere((b) => b.id == book.id);

    if (index == -1) {
      throw Exception('Book not found');
    }

    Book existingBook = books[index];

    // 새로운 책 객체의 필드가 빈 값이 아닌 경우에만 업데이트
    Book updatedBook = Book(
      id: existingBook.id,
      title: book.title.isNotEmpty ? book.title : existingBook.title,
      author: book.author.isNotEmpty ? book.author : existingBook.author,
      isbn: book.isbn.isNotEmpty ? book.isbn : existingBook.isbn,
      publishedDate: book.publishedDate ?? existingBook.publishedDate,
      // 다른 필드들도 동일한 방식으로 처리
    );

    books[index] = updatedBook;
    await writeCsvFile(csvFilePath, books.map((book) => book.toCsv()).toList());
    return updatedBook;
  }
}
