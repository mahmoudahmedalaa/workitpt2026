import 'package:flutter/widgets.dart';

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

extension CapatalizeFirst on String {
  String capitalizeFirst() => '${this.toLowerCase().inCaps}';
  String capitalizeEachFirst() =>
      '${this.toLowerCase().capitalizeFirstofEach()}';
}

extension CapExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get allInCaps => toUpperCase();

  String capitalizeFirstofEach() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.inCaps)
      .join(' ');
}

extension FunctionExtension on Function {
  Function execute(BuildContext context, Function function) {
    FocusScope.of(context).unfocus();
    return function;
  }
}

// extension ImageCompression on File {
//   Future<File?> compressFile({int quality = 80, int rotation = 0}) async {
//     var result = await FlutterImageCompress.compressAndGetFile(
//       this.absolute.path,
//       (await path_provider.getTemporaryDirectory()).absolute.path + 'temp.jpg',
//       quality: quality,
//       rotate: rotation,
//     );
//
//     debugPrint(this.lengthSync().toString());
//     debugPrint(result?.lengthSync().toString());
//
//     return result;
//   }
//
//   Future<Uint8List?> compressToUint8List(
//       {int quality = 50, int rotation = 0}) async {
//     var result = await FlutterImageCompress.compressWithFile(
//       this.absolute.path,
//       quality: quality,
//       rotate: rotation,
//     );
//
//     debugPrint(this.lengthSync().toString());
//
//     return result;
//   }
// }
