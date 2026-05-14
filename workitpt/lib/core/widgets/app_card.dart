import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Card(
        elevation: .7,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      );
}
