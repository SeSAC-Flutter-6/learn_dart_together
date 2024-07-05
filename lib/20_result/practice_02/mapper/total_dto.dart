import 'package:learn_dart_together/20_result/practice_02/dto/photo_dto.dart';

class TotalDto {
  int? total;
  int? totalPhotos;
  List<PhotoDto>? photos;

//<editor-fold desc="Data Methods">
  TotalDto({
    this.total,
    this.totalPhotos,
    this.photos,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TotalDto &&
          runtimeType == other.runtimeType &&
          total == other.total &&
          totalPhotos == other.totalPhotos &&
          photos == other.photos);

  @override
  int get hashCode => total.hashCode ^ totalPhotos.hashCode ^ photos.hashCode;

  @override
  String toString() {
    return 'TotalDto{total: $total, totalPhotos: $totalPhotos, photos: $photos,}';
  }

  TotalDto copyWith({
    int? total,
    int? totalPhotos,
    List<PhotoDto>? photos,
  }) {
    return TotalDto(
      total: total ?? this.total,
      totalPhotos: totalPhotos ?? this.totalPhotos,
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'totalPhotos': totalPhotos,
      'photos': photos,
    };
  }

  factory TotalDto.fromJson(Map<String, dynamic> map) {
    return TotalDto(
      total: map['total'] as int,
      totalPhotos: map['totalPhotos'] as int,
      photos: map['photos'] as List<PhotoDto>,
    );
  }

//</editor-fold>
}
