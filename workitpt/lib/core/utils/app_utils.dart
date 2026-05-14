import 'dart:io';
import 'dart:math';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../export.dart';

String convertWhiteSpaceUrl(String text) => text.replaceAll(' ', '%20');

Future<File> findCachedImagePath(String imageUrl) async {
  final cache = DefaultCacheManager();
  final file = await cache.getSingleFile(imageUrl);
  return file;
}

List<T> ArrayfromJson<T>(
        List<dynamic> data, T Function(Map<String, dynamic>) fromJson) =>
    List<T>.from(
      data.map((x) => fromJson(x as Map<String, dynamic>)),
    );
// ignore: inference_failure_on_untyped_parameter
T ObjectfromJson<T>(data, T Function(Map<String, dynamic>) fromJson) =>
    fromJson(data as Map<String, dynamic>);
List<T> castList<T>(List<dynamic> list) {
  final typedList = <T>[];
  for (final item in list) {
    if (item is T) {
      typedList.add(item);
    }
  }
  return typedList;
}

String getFileSize(String filepath) {
  final file = File(filepath);
  final bytes = file.lengthSync();
  if (bytes <= 0) {
    return '0 B';
  }
  const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
  final i = (log(bytes) / log(1024)).floor();
  return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${suffixes[i]}';
}

bool canUseImage(String filepath) {
  final file = File(filepath);
  final bytes = file.lengthSync();
  final sizeInMb = bytes / (1024 * 1024);
  print(sizeInMb);
  if (sizeInMb <= 5) {
    return true;
  } else {
    EasyLoading.showError('Selected file exceeds 5MB');
    return false;
  }
}

String convertList({List<String>? list}) {
  if (list == null || list.isEmpty) {
    return '';
  } else {
    return list.toString();
  }
}

String secureEmailFormatter({required String email}) =>
    email.replaceRange(0, 5, '*****');

String getGreeting() {
  var hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
