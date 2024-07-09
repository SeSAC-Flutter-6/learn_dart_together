import 'dart:async';

import 'package:learn_dart_together/21_design/core/network_error.dart';
import 'package:learn_dart_together/21_design/core/result.dart';
import 'package:learn_dart_together/21_design/data/data_source/checkout_data_source_api.dart';
import 'package:learn_dart_together/21_design/data/model/checkout.dart';
import 'package:learn_dart_together/21_design/data/repository/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final filepath = 'E:/src/lecture/sesac_learn_dart_together/learn_dart_together'
      '/lib/21_design/data/data_source/checkout.text';
  @override
  Future<Result<List<CheckOut>, NetworkError>> fetchReadCheckOut() {
    // TODO: implement fetchReadCheckOut
    throw UnimplementedError();
  }

  @override
  Future<Result<CheckOut, NetworkError>> getCheckOutCreate(
      CheckOut checkout) async {
    final jsonUserStringList = await CheckOutApi().loadCheckoutFromFile(filepath);
    try {
      List<CheckOut> checkoutCreate = jsonUserStringList
          .map((jsonItem) => CheckOut.fromJson(jsonItem as Map<String, dynamic>))
          .toList();
      if (!checkoutCreate.contains(checkout)) {
        checkoutCreate.add(checkout);
        print('user 정보가 가입되었습니다.');
      } else {
        print('user 정보가 이미 존재합니다.');
      } //없으면 알려주는 로직
      return Result.success(checkout);
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }

  @override
  Future<Result<CheckOut, NetworkError>> getCheckOutDelete(CheckOut checkout) {
    // TODO: implement getCheckOutDelete
    throw UnimplementedError();
  }

  @override
  Future<Result<CheckOut, NetworkError>> getCheckOutUpdate(CheckOut checkout) {
    // TODO: implement getCheckOutUpdate
    throw UnimplementedError();
  }

  @override
  Future<Result<CheckOut, NetworkError>> getCheckRead(int id) {
    // TODO: implement getCheckRead
    throw UnimplementedError();
  }
}
