import 'package:intl/intl.dart';
import 'package:learn_dart_together/18_design/data/model/book.dart';
import 'package:learn_dart_together/18_design/data/model/user.dart';

extension BookMapper on Book {
  String toCSV() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return [
      id.toString(),
      title,
      extensionCount,
      checkoutStatus.name,
      formatter.format(publishedData),
    ].join(',');
  }
}