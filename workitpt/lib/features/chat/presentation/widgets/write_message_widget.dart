import 'package:flutter/material.dart';
import 'package:workitpt/core/constants/spacing.dart';

import '../../../../gen/assets.gen.dart';

class WriteMessageWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;

  const WriteMessageWidget({
    super.key,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 08, vertical: 08),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller,
                // onTapOutside: (v){
                //   FocusManager.instance.primaryFocus?.unfocus();
                // },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your message here...',
                  contentPadding: EdgeInsets.only(left: 10),
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 40,
                  width: 40,
                  padding: allPadding4,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(Assets.icons.sendMessage.path),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(49),
              color: const Color(0xffF3F3F3)),
        ),
      );
}
