part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.onLoading() = _onLoading;
  const factory ChatState.onGetChatHistorySuccess(
      CommonModel<List<ChatModel>> model) = _onGetChatHistorySuccess;
  const factory ChatState.onGetUserChatHistorySuccess(
      CommonModel<List<ChatModel>> model) = _onGetUserChatHistorySuccess;
  const factory ChatState.onFailure(String? message) = _onFailure;
}
