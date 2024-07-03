import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
class StoreDto with _$StoreDto {
  factory StoreDto(
      String? addr,
      String? code,
      String? createdAt,
      num? lat,
      num? lng,
      String? name,
      String? remainStat,
      String? stockAt,
      String? type) = _StoreDto;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
}
