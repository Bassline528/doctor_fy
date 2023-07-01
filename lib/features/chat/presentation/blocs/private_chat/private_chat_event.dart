part of 'private_chat_bloc.dart';

abstract class PrivateChatEvent extends Equatable {
  const PrivateChatEvent();

  @override
  List<Object> get props => [];
}

class PrivateChatLoadMessages extends PrivateChatEvent {
  const PrivateChatLoadMessages({required this.messages});

  final List<Message> messages;
}

class PrivateChatSendMessage extends PrivateChatEvent {
  const PrivateChatSendMessage({required this.message});

  final String message;
}
