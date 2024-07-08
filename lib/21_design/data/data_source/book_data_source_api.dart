import 'dart:convert';

final String jsonBookString = '''[
  {
  "id": 1,
    "title": "Harry Potter",
    "author" : "abbie",
    "publishedAt" : "2012-07-02",
    "isbn" : 1212
  }
  {
  "id": 2,
    "title": "Harry Potter : series 2",
    "author" : "abbie",
    "publishedAt" : "2014-12-12",
    "isbn" : 1212
  }
  {
  "id": 3,
    "title": "Harry Potter : series 3",
    "author" : "abbie",
    "publishedAt" : "2018-10-15",
    "isbn" : 1212
  }
]''';

List<String> jsonBookStringList = jsonDecode(jsonBookString);
