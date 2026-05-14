import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class ImageItemWidget extends StatefulWidget {
  final File? image;
  final VoidCallback onPressed;
  const ImageItemWidget({super.key, this.image, required this.onPressed});

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: widget.image != null
                  ? Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.images.onboard1.path,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            top: 0,
            right: 8,
            child: InkWell(
              onTap: widget.onPressed,
              child: Image.asset(
                Assets.images.deleteImage.path,
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      );
}
