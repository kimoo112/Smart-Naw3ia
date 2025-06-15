import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_message_model.dart';
import '../../data/services/chatbot_service.dart';
import '../../../notifications/data/services/notification_helper.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatbotService _chatbotService;
  String _currentLocale = 'en';
  bool _isInChatScreen = false;

  ChatCubit()
      : _chatbotService = ChatbotService(),
        super(ChatInitial([])) {
    _showWelcomeMessage();
  }

  void setInChatScreen(bool isInChat) {
    _isInChatScreen = isInChat;
  }

  void _showWelcomeMessage() {
    final welcomeMessage = _chatbotService.generateResponse('', _currentLocale);
    final currentMessages = (state as ChatInitial).messages;

    // If there are no messages or the first message is a welcome message, update it
    if (currentMessages.isEmpty ||
        (currentMessages.length == 1 &&
            currentMessages[0].type == MessageType.bot)) {
      final updatedMessages = [
        ChatMessageModel(
          message: welcomeMessage,
          type: MessageType.bot,
        ),
      ];
      emit(ChatInitial(updatedMessages));
    }
  }

  void updateLocale(String locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      _showWelcomeMessage();
    }
  }

  void sendMessage(String message, String locale) {
    _currentLocale = locale;
    final currentState = state as ChatInitial;
    final currentMessages = List<ChatMessageModel>.from(currentState.messages);
    bool wasInChatScreen = _isInChatScreen; // Capture the current screen state

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

    // Add bot response after a delay (increased to 2 seconds)
    Future.delayed(const Duration(seconds: 2), () {
      final updatedMessages = List<ChatMessageModel>.from(currentMessages);
      updatedMessages.add(
        ChatMessageModel(
          message: response,
          type: MessageType.bot,
        ),
      );
      emit(ChatInitial(updatedMessages));

      // Show notification if we were in chat screen but now we're not
      if (wasInChatScreen && !_isInChatScreen) {
        NotificationHelper.showNotificationWithAction(
          title: locale == 'ar' ? 'رسالة جديدة' : 'New Message',
          body: response,
          buttonText: locale == 'ar' ? 'الرد' : 'Reply',
          actionKey: 'REPLY_TO_CHAT',
        );
      }
    });
  }

  void clearChat() {
    // When clearing chat, show welcome message again with current locale
    final welcomeMessage = _chatbotService.generateResponse('', _currentLocale);
    final updatedMessages = [
      ChatMessageModel(
        message: welcomeMessage,
        type: MessageType.bot,
      ),
    ];
    emit(ChatInitial(updatedMessages));
  }
}
