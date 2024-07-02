import 'package:learn_dart_together/15_dto_mapper/dto/mask_store_dto/mask_store_dto.dart';

abstract interface class MaskStoreApi {
  Future<List<MaskStoreDto>> getStores({double? lat, double? lng});
}
