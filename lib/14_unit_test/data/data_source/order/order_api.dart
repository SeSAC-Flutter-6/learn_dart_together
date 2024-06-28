abstract interface class OrderApi {
  Future<void> createOrder(Map<String, dynamic> order);
  Future<void> addOrderItem({int orderId, Map<String, dynamic> orderItem});
  Future<List<Map<String, dynamic>>> getAllOrders();
  Future<Map<String, dynamic>?> getOrder(int orderId);
  Future<List<Map<String, dynamic>>> getOrdersByUser(String userId);
  Future<String> getOrderStatus(int orderId);
  Future<bool> checkOrderExists(int orderId);
  Future<void> cancelOrder(int orderId);
  Future<void> updateOrderStatus({int orderId, String updatedStatus});
  Future<void> deleteOrderItem({int orderId, Map<String, dynamic> orderItem});
}
