import 'package:flutter/material.dart';

class TitleTextView extends StatelessWidget {
  final String title;
  const TitleTextView({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
      );
}
