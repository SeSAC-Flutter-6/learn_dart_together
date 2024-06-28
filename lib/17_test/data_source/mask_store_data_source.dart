import 'package:learn_dart_together/17_test/dto/mask_store_dto.dart';

abstract interface class MaskStoreDataSource {
  Future<List<StoreDto>> getStores(num lat, num lng);
}
