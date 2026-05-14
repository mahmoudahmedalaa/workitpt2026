import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const ViewAllButton({super.key, this.title = 'View All', this.onPressed});

  @override
  Widget build(BuildContext context) => TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Theme.of(context).primaryColor),
      ));
}
