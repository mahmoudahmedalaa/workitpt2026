import '../constants/keys/app_keys.dart';

String concatImageUrl(String imageUrl) {
  if (imageUrl.isNotEmpty) {
    if (imageUrl.startsWith('http')) {
      return imageUrl;
    } else {
      return '${AppKeys.imageBaseUrl}media/$imageUrl';
    }
  }
  return 'https://www.caribbeangamezone.com/wp-content/uploads/2018/03/avatar-placeholder.png';
}
