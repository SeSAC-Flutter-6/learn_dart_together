import '../data_source/order_data_source.dart';
import '../model/order.dart';
import '../model/order_item.dart';

class InMemoryOrderDataSourceImpl implements OrderDataSource {
  List<Order> _orderList = [
    Order(
        id: 1,
        userId: 1,
        status: 'accepted',
        createdAt: DateTime.parse('2023-05-04 18:46:45.546'),
        orderItems: [
          OrderItem(
            id: 1,
            productId: 1,
            quantity: 5,
            price: 100,
          ),
          OrderItem(
            id: 2,
            productId: 1,
            quantity: 6,
            price: 200,
          ),
          OrderItem(
            id: 3,
            productId: 2,
            quantity: 7,
            price: 300,
          ),
        ]),
    Order(
      id: 2,
      userId: 1,
      status: 'canceled',
      createdAt: DateTime.parse('2023-05-04 18:46:45.546'),
      orderItems: [
        OrderItem(
          id: 1,
          productId: 3,
          quantity: 1,
          price: 1000,
        ),
      ],
    )
  ];

  List<Order> get orderList => _orderList;

  @override
  Future<void> createOrder(Order order) async {
    _orderList.add(order);
  }

  @override
  Future<void> deleteOrder(int id) async {
    _orderList = _orderList.where((order) => order.id != id).toList();
  }

  @override
  Future<Order?> getOrder(int id) async =>
      _orderList.singleWhere((order) => order.id == id);

  @override
  Future<List<Order>> getOrders() async => _orderList;

  @override
  Future<Order> updateOrder(Order order) async {
    final index = _orderList.indexWhere((element) => element.id == order.id);
    if (index != -1) {
      _orderList[index] = order;
    } else {
      throw Exception('해당 주문이 없습니다.');
    }
    return _orderList[index];
  }
}
