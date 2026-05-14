import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SessionSliderItem extends StatelessWidget {
  final String imageLink;

  const SessionSliderItem({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async {},
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: authGradient,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(imageLink),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //     Colors.black.withOpacity(0.2), BlendMode.darken),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: authGradient,
              ),
            )
          ],
        ),
      );
}
