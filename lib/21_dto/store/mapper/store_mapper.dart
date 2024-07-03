import 'package:learn_dart_together/21_dto/store/dto/store_dto.dart';
import 'package:learn_dart_together/21_dto/store/model/store.dart';

extension StoreMapper on Stores {
  Store dtoToModel() {
    return Store(
      address: addr ?? '',
      latitude: lat ?? 0.0,
      longitude: lng ?? 0.0,
      name: name ?? '',
      remainStatus: remainStat ?? '',
    );
  }
}
