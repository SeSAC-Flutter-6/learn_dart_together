import 'dart:convert';

import 'dart:typed_data';

import 'package:learn_dart_together/15_datasource/main.dart';
import 'package:learn_dart_together/data/data_source/todo_data_source.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('', () {

  });
}

class MockTodoDataSource implements TodoDataSource {
  @override
  Future<List<Todo>> getData() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Todo(userId: 1, id: 1, title: 'title', completed: true),
      Todo(userId: 1, id: 2, title: 'title', completed: true),
      Todo(userId: 1, id: 3, title: 'title', completed: true),
    ];
  }
}

class MockClient implements http.Client {
  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<http.Response> delete(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<http.Response> head(Uri url, {Map<String, String>? headers}) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<http.Response> patch(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<http.Response> post(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<http.Response> put(Uri url, {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    // TODO: implement readBytes
    throw UnimplementedError();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    throw UnimplementedError();
  }

}