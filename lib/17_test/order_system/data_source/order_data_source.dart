import '../model/order.dart';

abstract interface class OrderDataSource {
  Future<Order?> getOrder(int id);

  Future<List<Order>> getOrders();

  Future<void> createOrder(Order order);

  Future<Order> updateOrder(Order order);

  Future<void> deleteOrder(int id);
}
