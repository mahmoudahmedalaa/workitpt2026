import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/export.dart';
import '../../../../core/utils/app_image_picker.dart';
import '../../../../core/utils/concat_image_url.dart';

// ignore: must_be_immutable
class ProfilePicWidget extends StatefulWidget {
  final String imagePath;
  final void Function(String?) setImage;
  const ProfilePicWidget({
    super.key,
    required this.imagePath,
    required this.setImage,
  });

  @override
  State<ProfilePicWidget> createState() => _ProfilePicWidgetState();
}

class _ProfilePicWidgetState extends State<ProfilePicWidget> {
  File? image;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async {
          image = await AppImagePicker().appImagePick(context: context);
          widget.setImage(image?.path ?? '');
        },
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundImage: image == null
                  ? widget.imagePath.isEmpty
                      ? null
                      : CachedNetworkImageProvider(
                          concatImageUrl(widget.imagePath),
                        ) as ImageProvider
                  : FileImage(image!),
            ),
            Positioned(
              right: 0,
              bottom: 5,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFA8F45),
                  ),
                  child: Image.asset(
                    Assets.icons.camera.path,
                  ).padding(all: 5),
                ),
              ).translate(offset: const Offset(5, 0)),
            ),
          ],
        ),
      );
}
