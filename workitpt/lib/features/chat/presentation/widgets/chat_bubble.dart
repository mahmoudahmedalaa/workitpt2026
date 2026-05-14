import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';

class ChatBubble extends StatelessWidget {
  final String text;

  /// [isCurrentUser] defines the current user
  /// set to true if the message is from the current user
  final bool isCurrentUser;
  final String? time;
  final String sender;
  const ChatBubble({
    super.key,
    required this.text,
    this.time,
    required this.sender,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(
          isCurrentUser ? 64.0 : 16.0,
          4,
          isCurrentUser ? 16.0 : 64.0,
          4,
        ),
        child: Align(
          alignment:
              isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Row(
            mainAxisAlignment:
                isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isCurrentUser)
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: concatImageUrl(sender),
                    height: 32,
                    width: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              if (!isCurrentUser) horizontalMargin8,
              Flexible(
                child: Column(
                  crossAxisAlignment: isCurrentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    verticalMargin8,
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isCurrentUser ? colorPrimary : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topRight:
                              isCurrentUser ? Radius.zero : Radius.circular(16),
                          topLeft:
                              isCurrentUser ? Radius.circular(16) : Radius.zero,
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color:
                                isCurrentUser ? Colors.white : Colors.black87),
                      ),
                    ),
                    Align(
                        alignment: isCurrentUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          time ?? '',
                          style: AppTextStyle.tinySMRegular,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
