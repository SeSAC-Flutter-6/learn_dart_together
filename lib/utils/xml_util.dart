class XmlUtils {
  // 특정 태그의 값을 추출하는 함수
  static String getElementValue(String xml, String tagName) {
    final pattern = RegExp('<$tagName>(.*?)</$tagName>');
    final match = pattern.firstMatch(xml);
    return match?.group(1)?.trim() ?? '';
  }

  // 특정 태그로 감싸진 여러개의 데이터를 추출하여 리스트로 반환
  static List<String> extractTagValues(String xml, String tagName) {
    final List<String> values = [];
    final pattern = RegExp('<$tagName>.*?</$tagName>');
    final matches = pattern.allMatches(xml);

    for (var match in matches) {
      if (match.group(0) != null) {
        values.add(match.group(0)?.trim() ?? '');
      }
    }
    return values;
  }
}
