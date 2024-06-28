import 'package:learn_dart_together/14_unit_test/order_system/model/order_item.dart';

import '../model/order.dart';
import '../model/product.dart';

abstract interface class OrderRepository {
  Future<void> createOrder(Order order);

  Future<Order?> getOrder(int id);

  Future<Order> updateOrderStatus(Order order, String target);

  Future<void> cancelOrder(Order order);

  Future<List<Order>> getOrdersByUser(int userId);

  Future<void> addOrderItem(Order order, Product product, int quantity);

  Future<void> removeOrderItem(Order order, OrderItem orderItem);

  Future<int> calculateOrderTotal(Order order);
}

