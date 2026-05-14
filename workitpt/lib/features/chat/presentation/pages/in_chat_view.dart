import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/utils/concat_image_url.dart';
import 'package:workitpt/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:workitpt/features/chat/presentation/widgets/chat_user_list_shimmer_view.dart';
import 'package:workitpt/features/chat/presentation/widgets/write_message_widget.dart';

import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/utils/date_util.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../authentication/login/data/models/user_model.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../data/model/chat_model.dart';
import '../../domain/controller/i_chat_cont.dart';
import '../widgets/chat_bubble.dart';

@RoutePage()
class InChatView extends StatefulWidget {
  final String sessionId;
  final String? sessionTitle;
  final String? avatar;

  InChatView(
      {super.key, required this.sessionId, this.sessionTitle, this.avatar});

  @override
  State<InChatView> createState() => _InChatViewState();
}

class _InChatViewState extends State<InChatView> {
  final TextEditingController _textController = TextEditingController();
  late IO.Socket socket;
  late StreamSocket streamSocket;
  Set<ChatModel> chatHistory = Set.from([]);
  final IChatController chatController;
  late final String id;
  ChatBloc chatBloc;

  _InChatViewState()
      : chatBloc = getIt<ChatBloc>(),
        chatController = getIt<IChatController>();

  @override
  void initState() {
    id = widget.sessionId;
    streamSocket = StreamSocket();
    initialSetup();
    super.initState();
  }

  initialSetup() async {
    await chatBloc
      ..add(ChatEvent.getChatHistory(id, 1));
    await _connectSocketAndListne();
    await getUserRole();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (chatHistory.length < total) {
          setState(() {
            page++;
          });
          chatBloc.add(ChatEvent.getChatHistory(id, page));
        }
      }
    });
  }

  bool isOnline = false;
  String? role;
  String? roleID;
  String? trainerName;
  String? trainerAvatar;
  UserModel? userModel;

  _connectSocketAndListne() async {
    socket = await chatController.createSocketConnection(
      socketUrl: 'https://workitpt-api.goswivt.com',
      streamSocket: streamSocket,
      sessionId: id,
    );
  }

  Future<void> getUserRole() async {
    userModel = await getIt<ISessionManager>().getCurrentUser();
    setState(() {
      roleID = userModel!.id;
      role = userModel!.role;
    });
  }

  @override
  void deactivate() {
    socket.disconnect();
    chatController.disconnectSocket();
    streamSocket.dispose();
    super.deactivate();
  }

  final ScrollController _scrollController = ScrollController();
  int page = 1;
  int total = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => chatBloc,
        child: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => BaseView(
                  color: Colors.white,
                  titleText: '',
                  titleWidget: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: concatImageUrl(trainerAvatar ?? ''),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      horizontalMargin8,
                      Text(
                        trainerName ?? '',
                      )
                    ],
                  ),
                  appBarColor: Colors.white,
                  elevation: 0,
                  body: ChatUserListShimmerView()),
              onGetChatHistorySuccess: (model) {
                final chatList = model.data!;

                if (model.currentPage != 1) {
                  chatHistory.addAll(model.data!);
                } else {
                  chatHistory = model.data!.toSet();
                }
                total = model.total!;
                chatHistory.addAll(chatList);
                if (chatList.isNotEmpty) {
                  if (role == ('TRAINER')) {
                    trainerName = chatList.first.session!.sessionTitle ?? '';
                    trainerAvatar = chatList.first.sender?.avatar ?? '';
                  } else {
                    trainerName = widget.sessionTitle;
                    trainerAvatar = widget.avatar;
                  }
                } else {
                  trainerName = widget.sessionTitle ?? '';
                  trainerAvatar = widget.avatar ?? '';
                }
                final chats = chatHistory.toList().reversed.toList();
                _scrollToLast(0);
                return BaseView(
                  color: Colors.white,
                  titleText: '',
                  titleWidget: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: concatImageUrl(trainerAvatar ?? ''),
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      horizontalMargin8,
                      Text(
                        trainerName ?? '',
                        style: AppTextStyle.bodyLgBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  appBarColor: Colors.white,
                  elevation: 0,
                  body: StreamBuilder(
                    stream: streamSocket.getMessageResponse,
                    builder:
                        (context, AsyncSnapshot<List<ChatModel>> snapshot) {
                      if (snapshot.hasData) {
                        chats.addAll(snapshot.data!);
                      }
                      _scrollToLast(0);
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: chats.length,
                              shrinkWrap: true,
                              controller: _scrollController,
                              physics: AlwaysScrollableScrollPhysics(),
                              // reverse: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final dt = chats[index].createdAt!;
                                final date =
                                    DateTime(dt.year, dt.month, dt.day);
                                final dateandtime = DateTime(
                                  dt.year,
                                  dt.month,
                                  dt.day,
                                  dt.hour,
                                  dt.minute,
                                );
                                final finalDate = dateandtime.toESTzone();
                                final time = DateTime(
                                  dt.hour,
                                  dt.minute,
                                );
                                String? dateText;
                                if (index == 0) {
                                  if (date.isToday) {
                                    dateText = "Today At " +
                                        DateFormat('hh:mm a').format(finalDate);
                                  } else {
                                    dateText =
                                        DateFormat('MMM dd,yyyy At hh:mm a')
                                            .format(finalDate);
                                  }
                                } else {
                                  final previousMessage = chats[index - 1];
                                  final previousDate = DateTime(
                                      previousMessage.createdAt!.year,
                                      previousMessage.createdAt!.month,
                                      previousMessage.createdAt!.day);
                                  final previousTime = DateTime(
                                    previousMessage.createdAt!.hour,
                                    previousMessage.createdAt!.minute,
                                  );
                                  if (previousDate != date) {
                                    dateText =
                                        DateFormat('MMM dd,yyyy At hh:mm a')
                                            .format(finalDate);
                                  } else if (previousDate == date &&
                                      previousTime != time) {
                                    dateText =
                                        DateFormat('hh:mm a').format(finalDate);
                                  }
                                }

                                return ChatBubble(
                                  time: dateText,
                                  sender: chats[index].sender!.avatar ?? '',
                                  text: chats[index].message ?? '',
                                  isCurrentUser: chats[index]
                                      .sender!
                                      .id!
                                      .startsWith(roleID ?? ''),
                                );
                              },
                            ),
                          ),
                          WriteMessageWidget(
                            controller: _textController,
                            onTap: () {
                              if (_textController.text.isNotEmpty) {
                                chatController.sendMessage(
                                  message: _textController.text.trim(),
                                );
                              }
                              _scrollToLast(0);
                              setState(
                                () {
                                  _textController.text = '';
                                },
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      );

  void _scrollToLast(int add) {
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      if (_scrollController.hasClients &&
          _scrollController.position.pixels !=
              _scrollController.position.maxScrollExtent) {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + add,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut);
      }
    });
  }
}
