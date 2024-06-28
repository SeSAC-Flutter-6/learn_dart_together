import 'package:learn_dart_together/14_unit_test/data/enum/order_status.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';

abstract interface class OrderRepository {
  Future<bool> createOrder(Order order);
  Future<Order?> getOrder(int orderId);
  Future<bool> updateOrderStatus(int orderId, OrderStatus updatedStatus);
  Future<bool> cancelOrder(int orderId);
  Future<List<Order>> getOrdersByUser(String userId);
  Future<bool> addOrderItem(int orderId, OrderItem item);
  Future<bool> removeOrderItem(int orderId, OrderItem item);
  Future<int?> calculateOrderTotal(int orderId); //주문 총액 계산
}
