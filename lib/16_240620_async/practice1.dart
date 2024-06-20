import 'dart:io';

Future<void> replaceHanToKimInCSV(String source) async {
  try {
    final sourceFile = File(source);
    if (!await sourceFile.exists()) {
      print('File not found: $source');
      return;
    }
    String csvContent = await sourceFile.readAsString();
    String updatedCsvContent = csvContent.replaceAll('한석봉', '김석봉');
    List<String> sourceParts = source.split('.');
    print('sourceParts는, $sourceParts'); //[sample, csv]
    String newFilePath = '${sourceParts[0]}_copy.${sourceParts[1]}';
    print('newFilePath는 $newFilePath'); //sample_copy.csv
    final newFile = File(newFilePath);

    await newFile.writeAsString(updatedCsvContent);
  } catch (e) {
    print('An error occurred: $e');
  }
}

Future<void> main() async {
  String source = 'sample.csv';
  await replaceHanToKimInCSV(source);
}
