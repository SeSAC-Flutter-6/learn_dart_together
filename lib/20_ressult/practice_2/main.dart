import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_timeout_exception_photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/mapper/photo_mapper.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';
import 'package:learn_dart_together/20_ressult/practice_2/repository/photo_repository_impl.dart';
import 'package:learn_dart_together/20_ressult/practice_2/core/result.dart';

void main() async {
  PhotoDataSource photoApi = MockPhotoApi();
  final jsonData = await photoApi.getPhotos('yellow, flowers');
  jsonData.map((e) => e.toPhoto()).forEach((element) {
    print(element);
  });

  // PhotoRepositoryImpl photoRepositoryImpl = PhotoRepositoryImpl();
  // final result = await photoRepositoryImpl.getPhotos('yellow, flowers');
  // result.when(
  //   success: (data) {
  //     for (var element in data) {
  //       print(element);
  //     }
  //   },
  //   error: (exception) {
  //     print(exception);
  //   },
  // );

  // PhotoRepositoryImpl photoRepositoryImpl =
  //     PhotoRepositoryImpl(MockTimeoutExceptionPhotoApi());
  // final result = await photoRepositoryImpl.getPhotos('바보');
  // switch (result) {
  //   case Success<List<Photo>>():
  //     print(result.data);
  //     break;
  //   case Error<List<Photo>>():
  //     print(result.e);
  //     break;
  // }
}
