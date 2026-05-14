import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:workitpt/features/chat/data/model/chat_model.dart';
import 'package:workitpt/features/chat/domain/repository/i_chat_repo.dart';

import '../../../authentication/signup/data/models/common_model.dart';
import '../../presentation/bloc/chat_bloc.dart';

abstract class IChatController {
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatHistory(
      String id, int page);

  Future<Either<String, CommonModel<List<ChatModel>>>> getChatLists();

  Future<IO.Socket> createSocketConnection(
      {required String socketUrl,
      required StreamSocket streamSocket,
      required String sessionId});

  void disconnectSocket();

  Future<void> sendMessage({
    required String message,
  });
}

@Injectable(as: IChatController)
class ChatController extends IChatController {
  final IChatRepository _repository;

  ChatController(this._repository);

  @override
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatHistory(
      String id, int page) async {
    final response = await _repository.getChatHistory(id, page);
    return response;
  }

  @override
  Future<IO.Socket> createSocketConnection(
          {required String socketUrl,
          required StreamSocket streamSocket,
          required String sessionId}) async =>
      await _repository.createSocketConnection(
          socketUrl: socketUrl,
          streamSocket: streamSocket,
          sessionId: sessionId);

  @override
  Future<void> sendMessage({
    required String message,
  }) async {
    return await _repository.sendMessage(message: message);
  }

  @override
  void disconnectSocket() => _repository.disconnectSocket();

  @override
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatLists() async {
    return await _repository.getChatLists();
  }
}
