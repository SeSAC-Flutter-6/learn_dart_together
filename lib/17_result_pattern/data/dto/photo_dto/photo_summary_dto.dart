import 'photo_dto.dart';

class PhotoSummaryDto {
  int? total;
  int? totalHits;
  List<PhotoDto>? hits;

  PhotoSummaryDto({this.total, this.totalHits, this.hits});

  factory PhotoSummaryDto.fromJson(Map<String, dynamic> json) =>
      PhotoSummaryDto(
        total: json['total'] as int?,
        totalHits: json['totalHits'] as int?,
        hits: (json['hits'] as List<dynamic>?)
            ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'totalHits': totalHits,
        'hits': hits?.map((e) => e.toJson()).toList(),
      };
}
