import 'package:learn_dart_together/13_unit_test/model/order.dart';

abstract interface class OrderDataSource {
  Future<List<Order>> getOrder();
  Future<void> updateOrderStatus(Order order);
  Future<void> cancelOrder(Order order);
  Future<List<Order>> getOrdersByUser(int userId);
  Future<void> addOrderItem(Order order);
  Future<void> removeOrderItem(Order order);
}