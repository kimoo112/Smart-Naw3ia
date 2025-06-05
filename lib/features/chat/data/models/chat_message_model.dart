enum MessageType { user, bot }

class ChatMessageModel {
  final String message;
  final MessageType type;

  const ChatMessageModel({
    required this.message,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type == MessageType.user ? 'user' : 'bot',
    };
  }

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      message: json['message'] as String,
      type: json['type'] == 'user' ? MessageType.user : MessageType.bot,
    );
  }
}
