part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started() = _Started;
  const factory ChatEvent.getChatHistory(String id, int page) =
      _onGetChatHistory;
  const factory ChatEvent.getUserChatHistory() = _onGetUserChatHistory;
}
