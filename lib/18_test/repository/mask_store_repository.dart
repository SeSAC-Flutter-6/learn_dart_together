abstract interface class MaskStoreRepository {
  Future<List<Store>> getAllStores();

  Future<Store?> getStore();

  Future<Store> getNearByRemainStat();


}