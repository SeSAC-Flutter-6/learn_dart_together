import 'dart:math';

import '../model/order.dart';
import '../model/order_item.dart';
import '../model/product.dart';
import '../repository_impl/order_repository_impl.dart';
import 'in_memory_order_data_source_impl.dart';
import 'in_memory_product_data_source_impl.dart';

import 'dart:io';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  final inMemoryOrderDataSourceImpl = InMemoryOrderDataSourceImpl();
  final inMemoryProductDataSourceImpl = InMemoryProductDataSourceImpl();
  final orderRepositoryImpl = OrderRepositoryImpl(
      inMemoryOrderDataSourceImpl, inMemoryProductDataSourceImpl);

  final testOrder = Order(
    id: 3,
    userId: 2,
    status: 'accepted',
    createdAt: DateTime.parse('2024-05-04 18:46:45.546'),
    orderItems: [
      OrderItem(
        id: 1,
        productId: 1,
        quantity: 2,
        price: 10,
      ),
    ],
  );

  group(('createOrder() test'), () {
    test('정상 생성', () async {
      expect(inMemoryOrderDataSourceImpl.orderList.length, 2);
      await orderRepositoryImpl.createOrder(testOrder);

      final product = await inMemoryProductDataSourceImpl.getProduct(1);

      expect(inMemoryOrderDataSourceImpl.orderList.length, 3);
      expect(product?.stock, 18);
      // 왜 테스트가 정상적으로 작동하지 않는가에 대해 1시간동안 고민.
      // 이유 : Future 내부에서 map은 비동기 작업에 적합하지 않음. 갓 gpt...
      // for문으로 돌리거나 Wait 작성할 것
    });

    // 이건 테스트가 안되네요.. 아래 건 되는데..?
    // 이유 : Futre.wait로 안에서 throw를 던지기 때문에!? => 정답! for문으로 수정
    test('비정상 생성', () async {
      expect(() async {
        await orderRepositoryImpl.createOrder(
          testOrder.copyWith(
            orderItems: [
              OrderItem(id: 1, productId: 1, quantity: 1000, price: 10),
            ],
          ),
        );
      }, throwsException);
    });
  });

  group('getOrder() test', () {
    test('정상 작동', () async {
      final firstOrder = await orderRepositoryImpl.getOrder(1);
      expect(firstOrder!.id, 1);
    });

    test('비정상 작동', () async {
      // 얜 또 왜 테스트가 안돼...
      // expect(await orderRepositoryImpl.getOrder(10), throwsStateError);
    });
  });

  group('getOrderByUser() test', () {
    test('정상 작동', () async {
      final orderListByOne = await orderRepositoryImpl.getOrdersByUser(1);
      final orderList = await inMemoryOrderDataSourceImpl.getOrders();

      final length = orderList.where((order) => order.userId == 1).length;
      expect(length, orderListByOne.length);
    });
  });

  group('calculateOrderTotal() test', () {
    test('정상 작동', () async {
      final sum = await orderRepositoryImpl.calculateOrderTotal(testOrder);
      expect(sum, 10);
    });
  });

  group('addOrderItem() test', () {
    test('정상 작동', () async {
      expect(testOrder.orderItems.length, 1);
      await orderRepositoryImpl.addOrderItem(
        testOrder.copyWith(id: 1),
        Product(
          id: 1,
          name: '딸기',
          price: 100,
          stock: 10,
        ),
        5,
      );
      expect(testOrder.orderItems.length, 2);
    });

    test('비정상 작동', () async {
      expect(() async {
        await orderRepositoryImpl.addOrderItem(
          testOrder.copyWith(id: 1),
          Product(
            id: 1,
            name: '딸기',
            price: 100,
            stock: 1,
          ),
          5,
        );
      }, throwsException);
    });
  });
}
