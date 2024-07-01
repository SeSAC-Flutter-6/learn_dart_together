import 'package:learn_dart_together/17_dto/dto/store_dto.dart';
import 'package:learn_dart_together/17_dto/model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      address: addr ?? '',
      latitude: lat ?? 0.0,
      longitude: lng ?? 0.0,
      name: name ?? '',
      remainStatus: remainStat ?? '',
    );
  }
}
