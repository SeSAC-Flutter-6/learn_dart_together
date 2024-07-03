import '../dto/mask_store_dto.dart';

abstract interface class MaskStoreDataSource {
  Future<List<StoreDto>> getStores();
}
