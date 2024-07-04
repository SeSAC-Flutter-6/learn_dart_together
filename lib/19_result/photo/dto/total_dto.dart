import 'photo_dto.dart';

class TotalDto {
  int? total;
  int? totalPhotos;
  List<PhotoDto>? photos;

  TotalDto({this.total, this.totalPhotos, this.photos});

  factory TotalDto.fromJson(Map<String, dynamic> json) => TotalDto(
        total: json['total'] as int?,
        totalPhotos: json['totalHits'] as int?,
        photos: (json['hits'] as List<dynamic>?)
            ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalHits': totalPhotos,
        'hits': photos?.map((e) => e.toJson()).toList(),
      };
}
