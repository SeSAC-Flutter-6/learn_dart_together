import 'package:learn_dart_together/18_dto_mapper/dto/mask_store_dto.dart';
import 'package:learn_dart_together/18_dto_mapper/model/store.dart';

extension MaskStoreMapper on StoreDto {
  Store toStore() {
    return Store(
      address: addr ?? '',
      latitude: lat ?? 0.0,
      longitude: lng ?? 0.0,
      title: name ?? '',
    );
  }
}
