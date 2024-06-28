abstract interface class OrderApi {
  Future<void> createOrder(Map<String, dynamic> order);
  Future<void> addOrderItem({int orderId, Map<String, dynamic> orderItem});
  Future<List<Map<String, dynamic>>> getAllOrders();
  Future<Map<String, dynamic>?> getOrder(int orderId);
  Future<String> getOrderStatus(int orderId);
  Future<bool> checkOrderExists(int orderId);
}
