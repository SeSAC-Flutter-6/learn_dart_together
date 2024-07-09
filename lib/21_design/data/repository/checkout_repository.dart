import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/model/checkout.dart';

import '../../core/network_error.dart';

abstract interface class CheckoutRepository {
  Future<Result<CheckOut, NetworkError>> getCheckOutCreate(CheckOut checkout);

  Future<Result<CheckOut, NetworkError>> getCheckRead(int id);

  Future<Result<List<CheckOut>, NetworkError>> fetchReadCheckOut();

  Future<Result<CheckOut, NetworkError>> getCheckOutUpdate(CheckOut checkout);

  Future<Result<CheckOut, NetworkError>> getCheckOutDelete(CheckOut checkout);
}