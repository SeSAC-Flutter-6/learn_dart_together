import 'package:learn_dart_together/15_dto_mapper/dto/mask_store_dto/mask_store_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/mask_store.dart';

extension MaskStoreMapper on MaskStoreDto {
  MaskStore toMaskStore() {
    return MaskStore(
      address: addr ?? 'Unknown Address',
      latitude: lat ?? 0.0,
      longitude: lng ?? 0.0,
      title: name ?? 'Unknown Title',
      remainStatus: _mapRemainStatus(remainStat?.toLowerCase()),
      type: type ?? 'Unknown Type',
    );
  }

  MaskRemainStatus _mapRemainStatus(String? status) {
    switch (status) {
      case 'plenty':
        return MaskRemainStatus.plenty;
      case 'some':
        return MaskRemainStatus.some;
      case 'few':
        return MaskRemainStatus.few;
      case 'empty':
        return MaskRemainStatus.empty;
      case 'break':
        return MaskRemainStatus.onBreak;
      default:
        return MaskRemainStatus.unknown;
    }
  }
}
