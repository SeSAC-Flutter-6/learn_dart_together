void main() {
  final numString = '10.5';
  int num = int.parse(numString);
  print(num);
}

//에러 발생 
// #0      int._handleFormatError (dart:core-patch/integers_patch.dart:127:5)
// #1      int._parseRadix (dart:core-patch/integers_patch.dart:138:16)
// #2      int._parse (dart:core-patch/integers_patch.dart:99:12)
// #3      int.parse (dart:core-patch/integers_patch.dart:61:12)
// #4      main (package:learn_dart_together/10_240618_exception/exception1.dart:3:17)
// #5      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
// #6      _RawReceivePort._handleMessage (dart:isolate-patch/isolate_patch.dart:184:12)
