import 'package:learn_dart_together/13_unit_test/data_source/order_data_source.dart';
import 'package:learn_dart_together/13_unit_test/data_source/product_data_source.dart';
import 'package:learn_dart_together/13_unit_test/model/Order.dart';
import 'package:learn_dart_together/13_unit_test/model/order_item.dart';

final class OrderRepository {
  final ProductDataSource _productDataSource;
  final OrderDataSource _orderDataSource;

  OrderRepository(this._orderDataSource, this._productDataSource);

  Future<Order> createOrder({
    required int id,
    required int userId,
    required String status,
    required String createdAt,
    required List<OrderItem> orderItems,
  }) async {
    return Order(id: id, userId: userId, status: status, createdAt: createdAt, orderItems: orderItems);
  }
}