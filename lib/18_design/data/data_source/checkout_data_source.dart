import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fast_csv/csv_converter.dart';
import 'package:learn_dart_together/18_design/data/model/checkout.dart';
import 'package:learn_dart_together/18_design/data/mapper/checkout_mapper.dart';

class CheckoutDataSource {
  static const _fileName = 'checkout_file.csv';
  static const _path = 'lib/18_design/assets/$_fileName';

  Future<List<Checkout>> getCheckouts() async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields.map((row) => Checkout.fromCsv(row)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Checkout?> getCheckout(int id) async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields
          .map((row) => Checkout.fromCsv(row))
          .singleWhereOrNull((checkout) => checkout.id == id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Checkout> createCheckout(Checkout checkout) async {
    try {
      final input = File(_path);
      await input.writeAsString(
        '\n${CheckoutMapper(checkout).toCSV()}',
        mode: FileMode.append,
        encoding: utf8,
      );
      return checkout;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Checkout> updateCheckout(int targetId, Checkout checkout) async {
    try {
      final input = File(_path);
      final lines = await input.readAsLines();
      final targetCheckout = await getCheckout(targetId);
      if (targetCheckout == null) throw Exception('User not found');

      final target = CheckoutMapper(targetCheckout).toCSV();
      final goal = CheckoutMapper(checkout).toCSV();

      final result = lines.map((line) {
        if (line == target) {
          return goal;
        }
        return line;
      }).toList();

      await input.writeAsString(
        result.join('\n'),
        encoding: utf8,
      );

      return checkout;
    } catch (e) {
      throw Exception(e);
    }
  }
}
