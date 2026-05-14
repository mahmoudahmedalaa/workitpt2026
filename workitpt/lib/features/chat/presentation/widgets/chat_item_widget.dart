import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/extension/url_extension.dart';
import '../../data/model/chat_model.dart';

class ChatItemWidget extends StatelessWidget {
  final bool isCurrentUser;
  final ChatModel chatModel;
  final bool showTimer;

  const ChatItemWidget(
      {super.key,
      this.isCurrentUser = false,
      required this.chatModel,
      required this.showTimer});

  @override
  Widget build(BuildContext context) {
    final image = chatModel.sender!.avatar;

    return Column(
      crossAxisAlignment:
          !isCurrentUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (chatModel.createdAt != null && showTimer)
          Text(
            DateFormat('hh:mm a').format(chatModel.createdAt!.toLocal()),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 8, color: Colors.black),
          ).padding(bottom: 2),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(8),
              topRight: const Radius.circular(8),
              bottomRight: Radius.circular(!isCurrentUser ? 8 : 0),
              bottomLeft: Radius.circular(!isCurrentUser ? 0 : 8),
            ),
//TODO:UPDATE HERE

            // color: !isCurrentUser
            //     ? AppColors.chatBoxGreyColor
            //     : AppColors.brownColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null)
                InkWell(
                    onTap: () {
//TODO:UPDATE HERE

                      // context.router.push(FullScreenImageViewRoute(
                      //     images: [image.url], index: 0));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                              imageUrl: image.url),
                        ),
                      ],
                    )),
              Padding(
                padding: EdgeInsets.only(top: image != null ? 5 : 0),
                child: Text(
                  chatModel.message ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: isCurrentUser ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
