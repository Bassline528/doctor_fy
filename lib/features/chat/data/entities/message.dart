class Message {
  Message({
    required this.id,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  /// Returns a new [Message] instance from a JSON object
  factory Message.fromJson(
    Map<String, dynamic> json, {
    required String myUserId,
  }) {
    return Message(
      id: json['id'] as String,
      profileId: json['profileId'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isMine: myUserId == json['profile_id'],
    );
  }
}
