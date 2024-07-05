import 'package:intl/intl.dart';
import 'package:learn_dart_together/18_design/data/model/user.dart';

extension UserMapper on User {
  String toCSV() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return [
      id.toString(),
      name,
      formatter.format(registedData),
      address,
      phone,
      formatter.format(birth),
    ].join(',');
  }
}