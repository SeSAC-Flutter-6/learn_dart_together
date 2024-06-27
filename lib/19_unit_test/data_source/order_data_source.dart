import 'package:learn_dart_together/19_unit_test/model/order.dart';
import 'package:learn_dart_together/19_unit_test/model/order_item.dart';

abstract interface class OrderDataSource {
  Future<void> createOrder(Order order);
  Future<Order?> getOrder(int orderId);
  Future<void> updateOrderStatus(int orderId, String newStatus);
  Future<void> cancelOrder(int orderId);
  Future<List<Order>> getOrdersByUser(int userId);
  Future<void> addOrderItem(int orderId, OrderItem orderItem);
  Future<void> removeOrderItem(int orderId, int itemIndex);
}
