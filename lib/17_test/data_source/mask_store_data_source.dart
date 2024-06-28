import '../model/store.dart';

abstract interface class MaskStoreDataSource {
  Future<List<Store>> getStores(num lat, num lng);
}
