import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/session/i_session_manager.dart';
import '../injection/injection.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final bool isAuthRequired;
  final double height;
  final double width;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.isAuthRequired,
    this.height = 100,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: getIt<ISessionManager>().getToken(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data as String;

            return CachedNetworkImage(
              placeholder: (context, url) => const SizedBox(
                width: 40,
                height: 40,
                child: CupertinoActivityIndicator(),
              ),
              imageUrl: imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              httpHeaders: isAuthRequired
                  ? {
                      'Authorization': 'Bearer $token',
                    }
                  : {},
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
}
