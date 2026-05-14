import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

int _getQuality(File? file, [int maxSizeInMB = 1]) {
  final sizeInMb = file!.lengthSync() / (1024 * 1024);
  if (sizeInMb <= maxSizeInMB) {
    return 100;
  }
  return (maxSizeInMB / sizeInMb * 100).round();
}

Future<XFile?> compressFile(File? file, [int maxSizeInMb = 1]) async {
  if (file == null) {
    return null;
  }
  final tempDir = await getTemporaryDirectory();
  final path = tempDir.path;
  final title = file.path.split('/').last;
  final compressImage = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    '$path/img_$title',
    quality: _getQuality(file, maxSizeInMb),
  );
  return compressImage;
}
