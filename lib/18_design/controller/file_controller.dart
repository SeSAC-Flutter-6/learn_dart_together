import 'dart:io';

import 'package:csv/csv.dart';

class FileController {

  Future<void> initialize(String path, List<List<String>> rows) async {
    bool fileExists = await _fileExists(path);

    if (!fileExists) {
      await _createFile(path, rows);
    }
  }

  Future<bool> _fileExists(String path) async {
    return File(path).exists();
  }

  Future<void> _createFile(String path, List<List<String>> rows) async {
    final file = File(path);
    await file.create(recursive: true);

    String csv = const ListToCsvConverter().convert(rows);
    await file.writeAsString(csv);
  }
}
