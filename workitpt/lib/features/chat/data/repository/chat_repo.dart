import 'package:dartz/dartz.dart';
import 'package:flutter_rest_client/flutter_rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:workitpt/features/chat/data/endpoint/chat_list_endpoint.dart';
import 'package:workitpt/features/chat/data/endpoint/get_chat_user_list_endpoint.dart';
import 'package:workitpt/features/chat/domain/repository/i_chat_repo.dart';

import '../../../../core/utils/app_utils.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../../authentication/signup/data/models/common_model.dart';
import '../../presentation/bloc/chat_bloc.dart';
import '../model/chat_model.dart';

@Injectable(as: IChatRepository)
class ChatRepository extends IChatRepository {
  final IHttpHelper _iHttpHelper;
  late Socket socket;
  final ISessionManager sessionManager;

  ChatRepository(this._iHttpHelper, this.sessionManager);

  @override
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatHistory(
      String id, int page) async {
    try {
      final response = await _iHttpHelper.request(
          ChatListEndpoint(id), BaseRequestModel(),
          queriesParams: {'page': page, 'limit': 10});
      if (response != null) {
        final model = CommonModel<List<ChatModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<ChatModel>(
                data as List<dynamic>, ChatModel.fromJson));
        return model.ok ? right(model) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, CommonModel<List<ChatModel>>>> getChatLists() async {
    try {
      final response = await _iHttpHelper.request(
        GetChatUserListEndPoint(),
        BaseRequestModel(),
      );
      if (response != null) {
        final model = CommonModel<List<ChatModel>>.fromJson(
            response as Map<String, dynamic>,
            (data) => ArrayfromJson<ChatModel>(
                data as List<dynamic>, ChatModel.fromJson));
        return model.ok ? right(model) : left(model.message!);
      } else {
        return left('Something went wrong');
      }
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<IO.Socket> createSocketConnection({
    required String socketUrl,
    required StreamSocket streamSocket,
    required String sessionId,
  }) async {
    try {
      final user = await sessionManager.getToken();
      socket = IO.io(
        socketUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'sessionId': sessionId})
            .setExtraHeaders({'authorization': "Bearer $user"})
            .enableForceNewConnection()
            .build(),
      );
      socket..connect();
      streamSocket.addMessageResponse([]);
      socket.on('msgReceived', (message) {
        print(message);
        final chat = ChatModel.fromJson(message);
        streamSocket.addMessageResponse([chat]);
      });

      return socket;
    } catch (e, stackTrace) {
      print('Error creating socket connection: $e');
      print(stackTrace);
      throw e; // You can handle the error as needed
    }
  }

  @override
  Future<void> sendMessage({required String message}) async {
    socket.emit(
      'chatMsg',
      {"msg": message},
    );
  }

  @override
  void disconnectSocket() async {
    if (socket.connected) {
      await socket.disconnect();
      socket.dispose();
      print('socket disconnected');
    }
  }
}
