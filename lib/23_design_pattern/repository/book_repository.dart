import 'package:learn_dart_together/23_design_pattern/model/book.dart';

abstract interface class BookRepository {
  bool addBookInformation(Book book); 
  List<Book> getAvailableBooks();
  List<Book> getBooksSortedByPublishedDate(); 
  Book? getBookById(int id); 
  void updateBook(int id, Book book); 
  int generateBookId(); 
 void deleteBook(int id);

 Future<void> saveBooks(); 
}