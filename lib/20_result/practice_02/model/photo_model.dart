import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_model.freezed.dart';

part 'photo_model.g.dart';

@freezed
class PhotoModel with _$PhotoModel {
  const factory PhotoModel({
    required List<String> tags,
    required String imageURL,
  }) = _PhotoModel;

  factory PhotoModel.fromJson(Map<String, Object?> json) =>
      _$PhotoModelFromJson(json);
}
