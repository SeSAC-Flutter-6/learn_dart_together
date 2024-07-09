import 'package:learn_dart_together/21_design_pattern/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/utils/csv_utils.dart';

class MemoryUserApi implements UserDataSource {
  final String csvFilePath = './assets/users.csv';

  @override
  Future<List<User>> getUsers() async {
    final csvData = await readCsvFile(csvFilePath);
    return csvData.map((line) => UserCsvExtension.fromCsv(line)).toList();
  }

  @override
  Future<User> getUser(int id) async {
    List<User> users = await getUsers();
    return users.firstWhere((user) => user.id == id);
  }

  // @override
  // Future<Book> createBook(Book book) async {
  //   List<Book> books = await getBooks();

  //   Book newBook = Book(
  //     id: books.isNotEmpty ? books.last.id! + 1 : 1,
  //     title: book.title,
  //     author: book.author,
  //     isbn: book.isbn,
  //     publishedDate: book.publishedDate,
  //   );

  //   books.add(newBook);
  //   List<String> csvData = books.map((book) => book.toCsv()).toList();
  //   await writeCsvFile(csvFilePath, csvData);
  //   return newBook;
  // }

  @override
  Future<User> createUser(User user) async {
    List<User> users = await getUsers();

    User newUser = User(
      id: users.isNotEmpty ? users.last.id! + 1 : 1,
      name: user.name,
      phone: user.phone,
      address: user.address,
      birthday: user.birthday,
      createdAt: DateTime.now(),
    );

    users.add(newUser);
    List<String> csvData = users.map((user) => user.toCsv()).toList();
    await writeCsvFile(csvFilePath, csvData);
    return newUser;
  }

  @override
  Future<User> deleteUser(int id) async {
    List<User> users = await getUsers();
    User userToDelete = users.firstWhere((user) => user.id == id);
    users.removeWhere((user) => user.id == id);

    await writeCsvFile(csvFilePath, users.map((user) => user.toCsv()).toList());
    return userToDelete;
  }

  // @override
  // Future<Book> updateBook(Book book) async {
  //   List<Book> books = await getBooks();
  //   int index = books.indexWhere((b) => b.id == book.id);

  //   if (index == -1) {
  //     throw Exception('Book not found');
  //   }

  //   Book existingBook = books[index];

  //   // 새로운 책 객체의 필드가 빈 값이 아닌 경우에만 업데이트
  //   Book updatedBook = Book(
  //     id: existingBook.id,
  //     title: book.title.isNotEmpty ? book.title : existingBook.title,
  //     author: book.author.isNotEmpty ? book.author : existingBook.author,
  //     isbn: book.isbn.isNotEmpty ? book.isbn : existingBook.isbn,
  //     publishedDate: book.publishedDate != DateTime(0)
  //         ? book.publishedDate
  //         : existingBook.publishedDate,
  //     // 다른 필드들도 동일한 방식으로 처리
  //   );

  //   books[index] = updatedBook;
  //   await writeCsvFile(csvFilePath, books.map((book) => book.toCsv()).toList());
  //   return updatedBook;
  // }

  @override
  Future<User> updateUser(User user) async {
    List<User> users = await getUsers();
    int index = users.indexWhere((u) => u.id == user.id);

    if (index == -1) {
      throw Exception('User not found');
    }

    User existingUser = users[index];

    User updatedUser = User(
      id: existingUser.id,
      name: user.name.isNotEmpty ? user.name : existingUser.name,
      phone: user.phone.isNotEmpty ? user.phone : existingUser.phone,
      address: user.address.isNotEmpty ? user.address : existingUser.address,
      birthday: user.birthday ?? existingUser.birthday,
      createdAt: user.createdAt ?? existingUser.createdAt,
    );

    users[index] = updatedUser;
    await writeCsvFile(csvFilePath, users.map((user) => user.toCsv()).toList());
    return updatedUser;
  }

  // publishedDate: book.publishedDate != DateTime(0)
  //   ? book.publishedDate
  //   : existingBook.publishedDate,
}
