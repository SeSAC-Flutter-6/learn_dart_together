import 'dart:convert';

abstract interface class Parser<T> {
  T parse(String data);
}

class JsonPasrser implements Parser<Map<String, dynamic>> {
  @override
  Map<String, dynamic> parse(String data) {
    // sth
    return jsonDecode(data);
  }
}

class XmlParser implements Parser<List<Map<String, dynamic>>> {
  @override
  List<Map<String, dynamic>> parse(String data) {
    // sth
    return jsonDecode(data);
  }
}
