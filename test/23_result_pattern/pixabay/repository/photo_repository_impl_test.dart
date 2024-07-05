import 'dart:convert';

import 'package:learn_dart_together/23_result_pattern/pixabay/core/result.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/data_source/mock_photo_data_source.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/model/photo.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final notJsonFormat = '''{
  "total": 45598,
  "totalHits": 500,
  "hits": [
  {
  "id": 593327,
  "pageURL": "https://pixabay.com/photos/desk-laptop-notebook-pen-workspace-593327/",
  "type": "photo",
  "tags": "desk, laptop, notebook",
  "previewURL": "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_150.jpg",
  "previewWidth": 150,
  "previewHeight": 99,
  "webformatURL": "https://pixabay.com/get/gf85409383066456a6de4b3802abc8fa7701f014903e446cc4e47e60ec3a393db3d1aba2b750db6c7a79f9b5991decd11_640.jpg",
  "webformatWidth": 640,
  "webformatHeight": 426,
  "largeImageURL": "https://pixabay.com/get/g49dbfc5ad57c9f8a6ce4cef788e36db8120ba55ea8e19523ffa208d2d5134a84dd677a4ec029732d9256eb52602487dfbc8de009d41eaacd3183ca716dec2cf2_1280.jpg",
  "imageWidth": 5472,
  "imageHeight": 3648,
  "imageSize": 2002366,
  "views": 875464,
  "downloads": 509887,
  "collections": 1688,
  "likes": 1171,
  "comments": 214,
  "user_id": 690514,
  "user": "StartupStockPhotos",
  "userImageURL": "https://cdn.pixabay.com/user/2018/01/17/16-45-10-30_250x250.jpg"
  },
  {
  "id": 5673901,
  "pageURL": "https://pixabay.com/photos/laptop-digital-device-technology-5673901/",
  "type": "photo",
  "tags": "laptop, digital device, technology",
  "previewURL": "https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_150.jpg",
  "previewWidth": 150,
  "previewHeight": 100,
  "webformatURL": "https://pixabay.com/get/ge30f18bae97305260f57440c7ac32cdc4c98bca0842cff55397744beee0ffa382f333bea3f17b8daea3bd9f97e8c9c8270513bef5d3c046c291f4f72aee2b3ba_640.jpg",
  "webformatWidth": 640,
  "webformatHeight": 428,
  "largeImageURL": "https://pixabay.com/get/g66a80004cc34befa12a53db00daa2a4ef25925c1dafd67cfe5a8c11ded395cbe2ab7b466d8aad483c0d719725de34f057ed78acf1a2fabf24d38afb6dd38e768_1280.jpg",
  "imageWidth": 5864,
  "imageHeight": 3922,
  "imageSize": 2800045,
  "views": 210709,
  "downloads": 140894,
  "collections": 331,
  "likes": 372,
  "comments": 55,
  "user_id": 12734309,
  "user": "OneSevenStudios",
  "userImageURL": ""
  },]}''';

  final testData = '''{
"total": 45598,
"totalHits": 500,
"hits": [
{
"id": 593327,
"pageURL": "https://pixabay.com/photos/desk-laptop-notebook-pen-workspace-593327/",
"type": "photo",
"tags": "desk, laptop, notebook",
"previewURL": "https://cdn.pixabay.com/photo/2015/01/08/18/25/desk-593327_150.jpg",
"previewWidth": 150,
"previewHeight": 99,
"webformatURL": "https://pixabay.com/get/gf85409383066456a6de4b3802abc8fa7701f014903e446cc4e47e60ec3a393db3d1aba2b750db6c7a79f9b5991decd11_640.jpg",
"webformatWidth": 640,
"webformatHeight": 426,
"largeImageURL": "https://pixabay.com/get/g49dbfc5ad57c9f8a6ce4cef788e36db8120ba55ea8e19523ffa208d2d5134a84dd677a4ec029732d9256eb52602487dfbc8de009d41eaacd3183ca716dec2cf2_1280.jpg",
"imageWidth": 5472,
"imageHeight": 3648,
"imageSize": 2002366,
"views": 875464,
"downloads": 509887,
"collections": 1688,
"likes": 1171,
"comments": 214,
"user_id": 690514,
"user": "StartupStockPhotos",
"userImageURL": "https://cdn.pixabay.com/user/2018/01/17/16-45-10-30_250x250.jpg"
},
{
"id": 5673901,
"pageURL": "https://pixabay.com/photos/laptop-digital-device-technology-5673901/",
"type": "photo",
"tags": "laptop, digital device, technology",
"previewURL": "https://cdn.pixabay.com/photo/2020/10/21/18/07/laptop-5673901_150.jpg",
"previewWidth": 150,
"previewHeight": 100,
"webformatURL": "https://pixabay.com/get/ge30f18bae97305260f57440c7ac32cdc4c98bca0842cff55397744beee0ffa382f333bea3f17b8daea3bd9f97e8c9c8270513bef5d3c046c291f4f72aee2b3ba_640.jpg",
"webformatWidth": 640,
"webformatHeight": 428,
"largeImageURL": "https://pixabay.com/get/g66a80004cc34befa12a53db00daa2a4ef25925c1dafd67cfe5a8c11ded395cbe2ab7b466d8aad483c0d719725de34f057ed78acf1a2fabf24d38afb6dd38e768_1280.jpg",
"imageWidth": 5864,
"imageHeight": 3922,
"imageSize": 2800045,
"views": 210709,
"downloads": 140894,
"collections": 331,
"likes": 372,
"comments": 55,
"user_id": 12734309,
"user": "OneSevenStudios",
"userImageURL": ""
}]}''';

  test('getPhotos() 실행시 에러 처리 테스트', () async {
    final repository1 = PhotoRepositoryImpl(
        photoDataSource: MockPhotoDataSource(mockData: notJsonFormat));
    final repository2 = PhotoRepositoryImpl(
        photoDataSource: MockPhotoDataSource(mockData: testData));
    final result1 = await repository1.getPhotos('');
    final result2 = await repository2.getPhotos('바보');
    final result3 = await repository2.getPhotos('');
    final testResult = jsonDecode(testData)['hits']
        .map((e) => Hits.fromJson(e))
        .map((e) => e.toPhoto())
        .toList;
    switch (result1) {
      case Success<List<Photo>>():
        print(result1.data);
      case Error<List<Photo>>():
        expect(result1.error, '알 수 없는 네트워크 에러');
    }
    switch (result2) {
      case Success<List<Photo>>():
        print(result2.data);
      case Error<List<Photo>>():
        expect(result2.error, '비속어를 사용할 수 없습니다.');
    }
    switch (result3) {
      case Success<List<Photo>>():
        expect(result3.data, testResult);
      case Error<List<Photo>>():
        print(result3.error);
    }
  });
}
