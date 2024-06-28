abstract interface class ProductApi {
  Future<List<Map<String, dynamic>>> getProducts(List<int> productIdList);
}
