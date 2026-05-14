import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleAndButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String action;

  const TitleAndButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.action});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                action,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xffCE5021)),
              ),
            ),
          ],
        ),
      );
}
