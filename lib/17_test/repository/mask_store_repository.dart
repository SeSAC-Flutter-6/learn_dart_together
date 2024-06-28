import '../model/store.dart';

abstract interface class MaskStoreRepository {
  Future<List<Store>> getAllStores();

  Future<Store?> getStore(String name);

  Future<List<Store>> getStoresByRemainStat(String remainStat);

  Future<List<Store>> getNearbyStores();
}
