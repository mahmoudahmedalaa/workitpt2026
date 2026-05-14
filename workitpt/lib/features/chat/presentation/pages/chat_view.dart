import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/core/utils/date_util.dart';
import 'package:workitpt/features/chat/data/model/chat_model.dart';
import 'package:workitpt/features/chat/presentation/bloc/chat_bloc.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../authentication/session/i_session_manager.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final chatBloc = getIt<ChatBloc>();

  String? role;

  Future<void> getUserRole() async {
    final userModel = await getIt<ISessionManager>().getCurrentUser();
    setState(() {
      role = userModel!.role;
    });
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => chatBloc..add(ChatEvent.getUserChatHistory()),
        child: BaseView(
          color: Colors.white,
          titleText: 'Chats',
          appBarColor: Colors.white,
          elevation: 0,
          body: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SizedBox(),
                onLoading: () {
                  return Center(child: CircularProgressIndicator());
                },
                onGetUserChatHistorySuccess: (model) {
                  return ListView.builder(
                    itemCount: model.data?.length ?? 0,
                    itemBuilder: (context, index) => ChatListTile(
                      model: model.data![index],
                      role: role!,
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}

class ChatListTile extends StatelessWidget {
  final ChatModel model;
  final String role;
  const ChatListTile({
    super.key,
    required this.model,
    required this.role,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () async {
          await context.router.push(
            InChatRoute(
              sessionId: model.id!,
              sessionTitle: model.session!.sessionTitle!,
              avatar: model.session?.trainer?.avatar,
            ),
          );
        },
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: concatImageUrl(model.session?.trainer?.avatar ?? ''),
            height: 40,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          model.session?.sessionTitle ?? '',
          style: AppTextStyle.bodyLgRegular,
        ),
        subtitle: Text(
          model.message ?? '',
          style: AppTextStyle.bodySMRegular.copyWith(color: darkText),
        ),
        trailing: Text(
          model.createdAt!.timeAgo(),
          style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
        ),
      );
}
