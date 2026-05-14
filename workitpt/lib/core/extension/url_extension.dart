import '../constants/keys/app_keys.dart';

extension UrlHelperExt on String? {
  String get url => this == null
      ? ''
      : this!.contains('https://')
          ? this!
          : (AppKeys.imageBaseUrl + ('/${this!}'.replaceFirst('//', '/')));
}

extension UrlEncodeExt on List<String> {
  String getEncodedIds(String fieldName) {
    String pattern = this.map((e) => '$fieldName[]=$e&').join();
    return pattern;
  }
}
