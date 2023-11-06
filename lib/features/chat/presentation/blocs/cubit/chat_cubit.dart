import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/features/chat/data/entities/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  StreamSubscription<List<Message>>? _messagesSubscription;
  List<Message> _messages = [];

  late final String _roomId;
  late final String _myUserId;

  void setMessagesListener(String roomId) {
    if (state is! ChatInitial) {
      return;
    }
    _roomId = roomId;

    _myUserId = supabase.auth.currentUser!.id;

    _messagesSubscription = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('room_id', roomId)
        .order('created_at', ascending: true)
        .limit(100)
        .map<List<Message>>(
          (data) => data
              .map<Message>(
                (row) => Message.fromMap(
                  map: row,
                  myUserId: _myUserId,
                ),
              )
              .toList(),
        )
        .listen((messages) {
          _messages = messages;
          if (_messages.isEmpty) {
            emit(ChatEmpty());
          } else {
            emit(ChatLoaded(_messages));
          }
        });
  }

  Future<void> sendMessage(String content, MessageType type) async {
    /// Add message to present to the user right away
    final message = Message(
      id: 'new',
      roomId: _roomId,
      profileId: _myUserId,
      content: content,
      createdAt: DateTime.now(),
      type: type,
      isMine: true,
    );
    //insert last
    _messages.add(message);
    emit(ChatLoaded(_messages));

    try {
      await supabase.from('messages').insert(message.toMap());
    } catch (_) {
      emit(ChatError('Error submitting message.'));
      _messages.removeWhere((message) => message.id == 'new');
      emit(ChatLoaded(_messages));
    }
  }

  @override
  Future<void> close() {
    _messagesSubscription?.cancel();
    return super.close();
  }
}
