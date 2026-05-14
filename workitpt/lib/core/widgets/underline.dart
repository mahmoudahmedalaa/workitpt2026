import 'package:flutter/material.dart';

class Underline extends StatelessWidget {
  const Underline({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xffEDEDED),
            ),
          ),
        ),
      );
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const VerticalDivider(
        color: Color(0xffC4C4C4),
        thickness: 1,
      );
}
