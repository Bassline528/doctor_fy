enum MessageType {
  texto,
  audio,
  imagen,
  video,
  localizacion,
}

class Message {
  Message({
    required this.id,
    required this.roomId,
    required this.profileId,
    required this.content,
    required this.createdAt,
    required this.isMine,
    required this.type,
  });

  /// ID of the message
  final String id;

  /// ID of the user who posted the message
  final String profileId;

  /// ID of the room the message belongs to
  final String roomId;

  /// Text content of the message
  final String content;

  /// Date and time when the message was created
  final DateTime createdAt;

  /// Whether the message is sent by the user or not.
  final bool isMine;

  /// Type of the message
  final MessageType type;

  Map<String, dynamic> toMap() {
    return {
      'profile_id': profileId,
      'room_id': roomId,
      'content': content,
      'message_type': type.toString().split('.').last,
    };
  }

  Message.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'] as String,
        roomId = map['room_id'] as String,
        profileId = map['profile_id'] as String,
        content = map['content'] as String,
        createdAt = DateTime.parse(map['created_at'] as String),
        type = _parseMessageType(map['message_type'] as String),
        isMine = myUserId == map['profile_id'];

  Message copyWith({
    String? id,
    String? userId,
    String? roomId,
    String? text,
    DateTime? createdAt,
    bool? isMine,
    MessageType? type,
  }) {
    return Message(
      id: id ?? this.id,
      profileId: userId ?? profileId,
      roomId: roomId ?? this.roomId,
      content: text ?? content,
      createdAt: createdAt ?? this.createdAt,
      isMine: isMine ?? this.isMine,
      type: type ?? this.type,
    );
  }
}

MessageType _parseMessageType(String type) {
  switch (type) {
    case 'texto':
      return MessageType.texto;
    case 'audio':
      return MessageType.audio;
    case 'imagen':
      return MessageType.imagen;
    case 'video':
      return MessageType.video;
    case 'localizacion':
      return MessageType.localizacion;
    default:
      throw ArgumentError('Invalid message type: $type');
  }
}
