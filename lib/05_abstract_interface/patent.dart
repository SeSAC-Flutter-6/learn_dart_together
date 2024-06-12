import 'package:learn_dart_together/05_abstract_interface/intangibleAsset.dart';

enum PatentStatus {
  active, expired, abandoned, pending
}

class Patent extends IntangibleAsset {
  String patentNumber;
  String inventor;
  DateTime filingDate;
  DateTime expirationDate;
  String description;
  PatentStatus status;

  Patent({
    required super.name,
    required super.price,
    required this.patentNumber,
    required this.inventor,
    required this.filingDate,
    required this.expirationDate,
    required this.description,
    required this.status,
  });
}