import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _handleGet)
  ..get('/echo/<message>', _echoHandler)
  ..post('/', _handlePost)
  ..put('/', _handlePut)
  ..patch('/', _handlePatch)
  ..delete('/', _handleDelete);

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Response _handleGet(Request request) {
  return Response.ok('Received GET request');
}

Future<Response> _handlePost(Request request) async {
  final content = await request.readAsString();
  return Response.ok('Received POST request with content: $content');
}

Future<Response> _handlePut(Request request) async {
  final content = await request.readAsString();
  return Response.ok('Received PUT request with content: $content');
}

Future<Response> _handlePatch(Request request) async {
  final content = await request.readAsString();
  return Response.ok('Received PATCH request with content: $content');
}

Response _handleDelete(Request request) {
  return Response.ok('Received DELETE request');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
