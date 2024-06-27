import 'dart:convert';

abstract interface class Parser<T> {
  T parse(String data);
}

class JsonParser implements Parser<Map<String, dynamic>> {
  @override
  Map<String, dynamic> parse(String data) {
    return jsonDecode(data);
  }
}

class XmlParser implements Parser<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> parse(String data) {
    // TODO: implement parse
    throw UnimplementedError();
  }
}

class XmlParser2 implements Parser<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> parse(String data) {
    // TODO: implement parse
    throw UnimplementedError();
  }
}