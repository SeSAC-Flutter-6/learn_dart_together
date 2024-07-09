import 'package:learn_dart_together/23_design_pattern/model/book.dart';
import 'package:learn_dart_together/23_design_pattern/repository/book_repository.dart';
import 'package:learn_dart_together/23_design_pattern/data_source/book_csv.dart';

class BookRepositoryImpl implements BookRepository {

final BookCsvApi _client;

BookRepositoryImpl({BookCsvApi? client}) : _client = client ?? BookCsvApi();

  List<Book> books = [];

  @override
  bool addBookInformation(Book book) {
    books.add(book);
    return true;
  }

  @override
  List<Book> getAvailableBooks() {
    return books.where((book) => book.isLoanable).toList();
  }

  @override
  List<Book> getBooksSortedByPublishedDate() {
    books.sort((a, b) => b.publishDate.compareTo(a.publishDate));
    return books;
  }

  @override
  Book? getBookById(int id) {
    return books.firstWhere((book) => book.id == id,);
  }

  @override
  void updateBook(int id, Book updatedBook) {
    int index = books.indexWhere((book) => book.id == id);
    if (index != -1) {
      books[index] = updatedBook;
    }
  }

  @override
  int generateBookId() {
    return books.isNotEmpty ? books.last.id + 1 : 1;
  }

  @override
  void deleteBook(int id) {
    books.removeWhere((book) => book.id == id);
  }

  //사용자 정보 저장
  @override
  Future<void> saveBooks() async {
    await _client.saveBook(books);
  }
}


