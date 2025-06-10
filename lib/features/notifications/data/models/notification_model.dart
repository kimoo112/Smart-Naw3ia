class NotificationsModel {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;

  NotificationsModel({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  NotificationsModel copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
