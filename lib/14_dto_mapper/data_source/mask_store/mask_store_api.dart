import 'package:learn_dart_together/14_dto_mapper/dto/mask_store_dto.dart';

abstract interface class MaskStoreAPI {
  Future<List<MaskStoreDTO>> getStores({double? lat, double? lng});
}