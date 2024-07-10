import 'package:learn_dart_together/21_design_pattern/data_source/book_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/utils/csv_utils.dart';

class MockBookApi implements BookDataSource {
  String csvMockData = '''id,title,author,isbn,publishedDate
1,The Great Gatsby,F. Scott Fitzgerald,9780743273565,1925-04-10T00:00:00.000
2,To Kill a Mockingbird,Harper Lee,9780061120084,1960-07-11T00:00:00.000
3,1984,George Orwell,9780451524935,1949-06-08T00:00:00.000
4,Harry Potter and the Sorcerer's Stone,J.K. Rowling,9780590353427,1997-06-26T00:00:00.000
5,Pride and Prejudice,Jane Austen,9780679783268,1813-01-28T00:00:00.000
6,The in the Rye,Salinger,9780316769488,1951-07-16T00:00:00.000''';

  @override
  Future<List<Book>> getBooks() async {
    final csvData = await readCsvData(csvMockData);
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
    books.add(book);
    csvMockData =
        writeCsvData(csvMockData, books.map((book) => book.toCsv()).toList());
    return book;
  }

  @override
  Future<Book> deleteBook(int id) async {
    List<Book> books = await getBooks();
    Book bookToDelete = books.firstWhere((book) => book.id == id);
    books.removeWhere((book) => book.id == id);

    csvMockData =
        writeCsvData(csvMockData, books.map((book) => book.toCsv()).toList());
    return bookToDelete;
  }

  @override
  Future<Book> updateBook(Book book) async {
    List<Book> books = await getBooks();
    int index = books.indexWhere((b) => b.id == book.id);
    books[index] = book;
    csvMockData =
        writeCsvData(csvMockData, books.map((book) => book.toCsv()).toList());
    return book;
  }
}
