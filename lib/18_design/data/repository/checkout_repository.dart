import 'package:learn_dart_together/18_design/data/model/checkout.dart';
import '../../core/result.dart';
import '../model/book.dart';
import '../model/user.dart';

abstract interface class CheckoutRepository {
  Future<Result<List<Checkout>>> getSortedByReturnCheckouts();

  Future<Result<Checkout?>> getCheckout(int id);

  Future<Result<Checkout>> createCheckout(Checkout checkout, Book book);

  Future<Result<Checkout>> returnBook(int userId, String title);

  Future<Result<Checkout>> findByCheckoutId(int id);

  Future<Result<void>> extensionCheckout(Book book);

  Future<Result<List<Book>>> getBooksCheckoutedByUser(User user);
}
