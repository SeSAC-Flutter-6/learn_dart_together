import 'package:learn_dart_together/21_design_pattern/data_source/check_out_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';
import 'package:learn_dart_together/21_design_pattern/utils/csv_utils.dart';

class MemoryCheckOutApi implements CheckOutDataSource {
  final String csvFilePath = './assets/check_outs.csv';

  @override
  Future<List<CheckOut>> getCheckOuts() async {
    final csvData = await readCsvFile(csvFilePath);
    return csvData.map((line) => CheckOutCsvExtension.fromCsv(line)).toList();
  }

  @override
  Future<CheckOut> getCheckOut(int id) async {
    List<CheckOut> checkOuts = await getCheckOuts();
    return checkOuts.firstWhere((checkOut) => checkOut.id == id);
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
  Future<CheckOut> createCheckOut(CheckOut checkOut) async {
    List<CheckOut> checkOuts = await getCheckOuts();
    int defaultExtensionCount = 0;

    CheckOut newCheckOut = CheckOut(
      id: checkOuts.isNotEmpty ? checkOuts.last.id! + 1 : 1,
      userId: checkOut.userId,
      bookId: checkOut.bookId,
      checkOutDate: checkOut.checkOutDate,
      dueDate: checkOut.checkOutDate?.add(Duration(days: 14)),
      returnDate: checkOut.returnDate,
      extensionCount: defaultExtensionCount,
    );

    checkOuts.add(newCheckOut);
    List<String> csvData =
        checkOuts.map((checkOut) => checkOut.toCsv()).toList();
    await writeCsvFile(csvFilePath, csvData);
    return newCheckOut;
  }

  @override
  Future<CheckOut> deleteCheckOut(int id) async {
    List<CheckOut> checkOuts = await getCheckOuts();
    CheckOut checkOutToDelete =
        checkOuts.firstWhere((checkOut) => checkOut.id == id);
    checkOuts.removeWhere((checkOut) => checkOut.id == id);

    await writeCsvFile(
        csvFilePath, checkOuts.map((checkOut) => checkOut.toCsv()).toList());
    return checkOutToDelete;
  }

  // @override
  // Future<User> updateUser(User user) async {
  //   List<User> users = await getUsers();
  //   int index = users.indexWhere((u) => u.id == user.id);

  //   if (index == -1) {
  //     throw Exception('User not found');
  //   }

  //   User existingUser = users[index];

  //   User updatedUser = User(
  //     id: existingUser.id,
  //     name: user.name.isNotEmpty ? user.name : existingUser.name,
  //     phone: user.phone.isNotEmpty ? user.phone : existingUser.phone,
  //     address: user.address.isNotEmpty ? user.address : existingUser.address,
  //     birthday: user.birthday ?? existingUser.birthday,
  //     createdAt: user.createdAt ?? existingUser.createdAt,
  //   );

  //   users[index] = updatedUser;
  //   await writeCsvFile(csvFilePath, users.map((user) => user.toCsv()).toList());
  //   return updatedUser;
  // }

  @override
  Future<CheckOut> updateCheckOut(CheckOut checkOut) async {
    List<CheckOut> checkOuts = await getCheckOuts();
    int index = checkOuts.indexWhere((c) => c.id == checkOut.id);

    if (index == -1) {
      throw Exception('CheckOut not found');
    }

    CheckOut existingCheckOut = checkOuts[index];

    CheckOut updatedCheckOut = CheckOut(
      id: existingCheckOut.id,
      userId: checkOut.userId ?? existingCheckOut.userId,
      bookId: checkOut.bookId ?? existingCheckOut.bookId,
      checkOutDate: checkOut.checkOutDate ?? existingCheckOut.checkOutDate,
      dueDate: checkOut.dueDate ?? existingCheckOut.dueDate,
      returnDate: checkOut.returnDate ?? existingCheckOut.returnDate,
      extensionCount:
          checkOut.extensionCount ?? existingCheckOut.extensionCount,
    );

    checkOuts[index] = updatedCheckOut;

    await writeCsvFile(
        csvFilePath, checkOuts.map((checkOut) => checkOut.toCsv()).toList());

    return updatedCheckOut;
  }
}
