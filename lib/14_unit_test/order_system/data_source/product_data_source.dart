import 'package:learn_dart_together/14_unit_test/order_system/model/product.dart';

abstract interface class ProductDataSource {
  Future<Product?> getProduct(int id);

  Future<List<Product>> getProducts();

  Future<void> createProduct(Product product);

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(int id);
}
