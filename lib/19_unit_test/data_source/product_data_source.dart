import 'package:learn_dart_together/19_unit_test/model/product.dart';

abstract interface class ProductDataSource {
  Future<Product?> getProduct(int productId);
  Future<void> updateProductStock(int productId, int newStock);
}
