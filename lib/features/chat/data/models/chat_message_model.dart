enum MessageType { user, bot }

class ChatMessageModel {
  final String message;
  final MessageType type;
  final DateTime timestamp;

  const ChatMessageModel({
    required this.message,
    required this.type,
    required this.timestamp,
  });
}
