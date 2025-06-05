part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {
  final List<ChatMessageModel> messages;
  ChatInitial(this.messages);
}
