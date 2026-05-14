import 'package:dartz/dartz.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:workitpt/features/chat/data/model/chat_model.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../../presentation/bloc/chat_bloc.dart';

abstract class IChatRepository {
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatHistory(
      String id, int page);

  Future<Either<String, CommonModel<List<ChatModel>>>> getChatLists();

  Future<IO.Socket> createSocketConnection(
      {required String socketUrl,
      required StreamSocket streamSocket,
      required String sessionId});

  void disconnectSocket();

  Future<void> sendMessage({required String message});
}
