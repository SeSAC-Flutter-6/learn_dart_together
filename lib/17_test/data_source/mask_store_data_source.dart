import 'package:learn_dart_together/17_test/dto/mask_store_dto.dart';

import '../model/store.dart';

abstract interface class MaskStoreDataSource {
  // Future<List<Store>> getStores(num lat, num lng);
  Future<List<StoreDto>> getStores(num lat, num lng);
}
