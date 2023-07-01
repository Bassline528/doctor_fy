part of 'private_chat_bloc.dart';

class PrivateChatState extends Equatable {
  const PrivateChatState({required this.messages});

  final List<Message> messages;

  @override
  List<Object> get props => [messages];

  PrivateChatState copyWith({
    List<Message>? messages,
  }) {
    return PrivateChatState(
      messages: messages ?? this.messages,
    );
  }
}
