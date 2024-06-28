import 'package:learn_dart_together/17_test/dto/mask_store_dto.dart';

import '../model/store.dart';

extension MaskStoreMapper on StoreDto {
  Store toStore() {
    return Store(
      address: addr!,
      latitude: lat!.toDouble(),
      longitude: lng!.toDouble(),
      title: name!,
      remainStatus: remainStat ?? '모름',
      type: type!,
    );
  }
}

// extension on Store {
//   StoreDto toDto() {
//
//   }
// }