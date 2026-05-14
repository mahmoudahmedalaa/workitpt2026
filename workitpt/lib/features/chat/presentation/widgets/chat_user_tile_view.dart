import 'package:flutter/material.dart';

import '../../../authentication/login/data/models/user_model.dart';

class ChatUserTileView extends StatelessWidget {
  final UserModel user;
  const ChatUserTileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(user.name ?? ''),
      );
}
