import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_check_out_api.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';

abstract interface class CheckOutDataSource {
  static CheckOutDataSource? _instance;

  factory CheckOutDataSource([CheckOutDataSource? api]) {
    _instance = api ?? MemoryCheckOutApi();
    return _instance!;
  }

  Future<List<CheckOut>> getCheckOuts();
  Future<CheckOut> getCheckOut(int id);
  Future<CheckOut> createCheckOut(CheckOut checkOut);
  Future<CheckOut> updateCheckOut(CheckOut checkOut);
  Future<CheckOut> deleteCheckOut(int id);

  // Future<List<CheckOut>> getCheckOutsByUserId(int userId);
}
