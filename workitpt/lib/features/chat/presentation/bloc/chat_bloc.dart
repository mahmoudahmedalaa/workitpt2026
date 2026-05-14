import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workitpt/features/authentication/signup/data/models/common_model.dart';
import 'package:workitpt/features/chat/data/model/chat_model.dart';

import '../../domain/controller/i_chat_cont.dart';

part 'chat_bloc.freezed.dart';
part 'chat_event.dart';
part 'chat_state.dart';

@Injectable()
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  IChatController _controller;
  ChatBloc(this._controller) : super(const ChatState.initial()) {
    on<ChatEvent>(
      (event, emit) async {
        emit(const ChatState.onLoading());
        await event.whenOrNull<FutureOr<void>>(
          getChatHistory: (id, page) async {
            try {
              final data = await _controller.getChatHistory(id, page);
              data.fold((l) => emit(ChatState.onFailure(l)), (data) {
                emit(ChatState.onGetChatHistorySuccess(data));
              });
            } on Exception catch (e) {
              emit(ChatState.onFailure(e.toString()));
            }
          },
          getUserChatHistory: () async {
            try {
              final data = await _controller.getChatLists();
              data.fold((l) => emit(ChatState.onFailure(l)), (data) {
                emit(ChatState.onGetUserChatHistorySuccess(data));
              });
            } on Exception catch (e) {
              emit(ChatState.onFailure(e.toString()));
            }
          },
        );
      },
    );
  }
}

class StreamSocket {
  final _socketMessageResponse = StreamController<List<ChatModel>>.broadcast();

  void Function(List<ChatModel>) get addMessageResponse {
    return (List<ChatModel> messages) {
      if (!_socketMessageResponse.isClosed) {
        _socketMessageResponse.sink.add(messages);
      } else {
        print('Stream controller is closed, cannot add messages.');
      }
    };
  }

  Stream<List<ChatModel>> get getMessageResponse =>
      _socketMessageResponse.stream;

  void dispose() {
    _socketMessageResponse.close();
  }
}
