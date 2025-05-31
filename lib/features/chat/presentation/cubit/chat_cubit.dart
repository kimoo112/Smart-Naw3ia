import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naw3ia/features/chat/data/models/chat_message_model.dart';
import 'package:naw3ia/features/chat/data/services/chatbot_service.dart';

// States
abstract class ChatState {}

class ChatInitial extends ChatState {
  final List<ChatMessageModel> messages;
  ChatInitial(this.messages);
}

// Cubit
class ChatCubit extends Cubit<ChatState> {
  final ChatbotService _chatbotService;

  ChatCubit()
      : _chatbotService = ChatbotService(),
        super(ChatInitial([]));

  void sendMessage(String message, String locale) {
    final currentState = state as ChatInitial;
    final currentMessages = List<ChatMessageModel>.from(currentState.messages);

    // Add user message
    currentMessages.add(
      ChatMessageModel(
        message: message,
        type: MessageType.user,
        timestamp: DateTime.now(),
      ),
    );

    // Generate bot response
    final response = _chatbotService.generateResponse(message, locale);

    // Add bot response
    currentMessages.add(
      ChatMessageModel(
        message: response,
        type: MessageType.bot,
        timestamp: DateTime.now(),
      ),
    );

    emit(ChatInitial(currentMessages));
  }

  void clearChat() {
    emit(ChatInitial([]));
  }
}
