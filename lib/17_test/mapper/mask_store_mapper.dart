import '../dto/mask_store_dto.dart';
import '../model/store.dart';

// extension MaskStoreMapper on StoreDto{
//   Store toStore(){
//     return Store(addr: addr, code: code, createdAt: createdAt, lat: lat, lng: lng, name: name, remainStat: remainStat, stockAt: stockAt, type: type)
//   };
// }
extension MaskStoreMapper on StoreDto {
  Store toStore() {
    return Store(
        address: addr!,
        latitude: lat!.toDouble(),
        longitude: lng!.toDouble(),
        title: name!,
        remainStatus: remainStat ?? '모름',
        type: type!);
  }
}
