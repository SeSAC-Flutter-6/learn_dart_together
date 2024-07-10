import 'package:intl/intl.dart';
import 'package:learn_dart_together/18_design/data/model/checkout.dart';

extension CheckoutMapper on Checkout {
  String toCSV() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return [
      id.toString(),
      userId.toString(),
      bookId.toString(),
      isReturned,
      formatter.format(checkoutDate),
      formatter.format(returnDate),
      extensionCount,
    ].join(',');
  }
}
