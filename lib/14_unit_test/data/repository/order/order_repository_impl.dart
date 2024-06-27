import 'package:learn_dart_together/14_unit_test/data/data_source/order/order_api.dart';
import 'package:learn_dart_together/14_unit_test/data/data_source/product/product_api.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';
import 'package:learn_dart_together/14_unit_test/data/repository/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApi _orderApi;
  final ProductApi _productApi;

  const OrderRepositoryImpl(
      {required OrderApi orderApi, required ProductApi productApi})
      : _orderApi = orderApi,
        _productApi = productApi;

  @override
  Future<bool> addOrderItem(int orderId, OrderItem item) {
    // TODO: implement addOrderItem
    throw UnimplementedError();
  }

  @override
  Future<int> calculateOrderTotal(int orderId) {
    // TODO: implement calculateOrderTotal
    throw UnimplementedError();
  }

  @override
  Future<bool> cancelOrder(int orderId) {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<bool> createOrder(Order order) {
    // TODO: implement createOrder
    throw UnimplementedError();
  }

  @override
  Future<Order?> getOrder(int orderId) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrdersByUser(String userId) {
    // TODO: implement getOrdersByUser
    throw UnimplementedError();
  }

  @override
  Future<bool> removeOrderItem(int orderId, int orderItemId) {
    // TODO: implement removeOrderItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrderStatus(int orderId, String newStatus) {
    // TODO: implement updateOrderStatus
    throw UnimplementedError();
  }
}
