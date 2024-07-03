import 'package:learn_dart_together/13_unit_test/model/product.dart';

abstract interface class ProductDataSource {
  Future<Set<Product>> getProductList();
  Future<Product> getProduct(int productId);
}