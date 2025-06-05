import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naw3ia/features/chat/data/models/chat_message_model.dart';
import 'package:naw3ia/features/chat/data/services/chatbot_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatbotService _chatbotService;
  String _currentLocale = 'en';

  ChatCubit()
      : _chatbotService = ChatbotService(),
        super(ChatInitial([])) {
    _showWelcomeMessage();
  }

  void _showWelcomeMessage() {
    final welcomeMessage = _chatbotService.generateResponse('', _currentLocale);
    emit(ChatInitial([
      ChatMessageModel(
        message: welcomeMessage,
        type: MessageType.bot,
      ),
    ]));
  }

  void updateLocale(String locale) {
    _currentLocale = locale;
    _showWelcomeMessage();
  }

  void sendMessage(String message, String locale) {
    _currentLocale = locale;
    final currentState = state as ChatInitial;
    final currentMessages = List<ChatMessageModel>.from(currentState.messages);

    // Add user message
    currentMessages.add(
      ChatMessageModel(
        message: message,
        type: MessageType.user,
      ),
    );
    emit(ChatInitial(currentMessages));

    // Get bot response
    final response = _chatbotService.generateResponse(message, locale);

    // Add bot response after a delay
    Future.delayed(const Duration(seconds: 1), () {
      final updatedMessages = List<ChatMessageModel>.from(currentMessages);
      updatedMessages.add(
        ChatMessageModel(
          message: response,
          type: MessageType.bot,
        ),
      );
      emit(ChatInitial(updatedMessages));
    });
  }

  void clearChat() {
    // When clearing chat, show welcome message again
    _showWelcomeMessage();
  }
}
