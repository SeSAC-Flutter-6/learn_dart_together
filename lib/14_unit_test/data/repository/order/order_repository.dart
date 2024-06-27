import 'package:learn_dart_together/14_unit_test/data/model/order.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';

abstract interface class OrderRepository {
  Future<bool> createOrder(Order order);
  Future<Order?> getOrder(int orderId);
  Future<void> updateOrderStatus(int orderId, String newStatus);
  Future<bool> cancelOrder(int orderId);
  Future<List<Order>> getOrdersByUser(String userId);
  Future<bool> addOrderItem(int orderId, OrderItem item);
  Future<bool> removeOrderItem(int orderId, int orderItemId);
  Future<int> calculateOrderTotal(int orderId); //주문 총액 계산
}
