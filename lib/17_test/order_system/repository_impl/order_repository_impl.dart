import '../data_source/order_data_source.dart';
import '../data_source/product_data_source.dart';
import '../model/order.dart';
import '../model/order_item.dart';
import '../model/product.dart';
import '../repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource _orderDataSource;
  final ProductDataSource _productDataSource;

  OrderRepositoryImpl(this._orderDataSource, this._productDataSource);

  @override
  Future<void> addOrderItem(Order order, Product product, int quantity) async {
    final orderItem = OrderItem(
        id: order.orderItems.length + 1,
        productId: product.id,
        quantity: quantity,
        price: product.price);

    if (product.stock < quantity) throw Exception('상품 수량이 부족합니다.');

    order.orderItems.add(orderItem);
    await _productDataSource
        .updateProduct(product.copyWith(stock: product.stock - quantity));
    await _orderDataSource.updateOrder(order);
  }

  @override
  Future<int> calculateOrderTotal(Order order) async {
    final sum = order.orderItems.fold(0, (sum, item) => sum + item.price);
    return sum;
  }

  // 주의 ! canceled만 되었지, db에는 남아 있습니다!
  @override
  Future<void> cancelOrder(Order order) async {
    for (final orderItem in order.orderItems) {
      final product = await _productDataSource.getProduct(orderItem.id);

      if (product == null) throw Exception('기존의 상품이 존재하지 않습니다.');

      await _productDataSource.updateProduct(
          product.copyWith(stock: product.stock + orderItem.quantity));
    }
    await _orderDataSource.updateOrder(order.copyWith(status: 'canceled'));
  }

  @override
  Future<void> createOrder(Order order) async {
    for (final orderItem in order.orderItems) {
      final product = await _productDataSource.getProduct(orderItem.id);

      if (product == null) throw Exception('기존의 상품이 존재하지 않습니다.');
      if (product.stock < orderItem.quantity) throw Exception('상품 수량이 부족합니다.');

      await _productDataSource.updateProduct(
          product.copyWith(stock: product.stock - orderItem.quantity));
    }
    await _orderDataSource.createOrder(order);
  }

  @override
  Future<Order?> getOrder(int id) async => await _orderDataSource.getOrder(id);

  @override
  Future<List<Order>> getOrdersByUser(int userId) async {
    final getOrders = await _orderDataSource.getOrders();
    return getOrders.where((order) => order.userId == userId).toList();
  }

  @override
  Future<void> removeOrderItem(Order order, OrderItem orderItem) async {
    order.orderItems.remove(orderItem);
    await _orderDataSource.updateOrder(order);

    final product = await _productDataSource.getProduct(orderItem.productId);
    if (product == null) throw Exception('기존의 상품이 존재하지 않습니다.');
    await _productDataSource.updateProduct(
        product.copyWith(stock: product.stock + orderItem.quantity));
  } // 재고 원복

  @override
  Future<Order> updateOrderStatus(Order order, String target) async {
    return _orderDataSource.updateOrder(order.copyWith(status: target));
  }
}
