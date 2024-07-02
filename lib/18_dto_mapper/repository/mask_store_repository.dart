import '../model/store.dart';

abstract interface class MaskStoreRepository {
  Future<List<Store>> getStores();
}
