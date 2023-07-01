import 'package:bloc/bloc.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/features/chat/data/entities/message.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'private_chat_event.dart';
part 'private_chat_state.dart';

class PrivateChatBloc extends Bloc<PrivateChatEvent, PrivateChatState> {
  PrivateChatBloc() : super(const PrivateChatState(messages: [])) {
    on<PrivateChatSendMessage>((event, emit) async {
      final text = event.message;
      final myUserId = supabase.auth.currentUser!.id;
      if (text.isEmpty) {
        return;
      }
      try {
        await supabase.from('messages').insert({
          'profile_id': myUserId,
          'content': text,
        });
      } on PostgrestException catch (error) {
        //TODO: Handle error
        return;
      } catch (_) {
        //TODO: Handle error
      }
    });

    on<PrivateChatLoadMessages>((event, emit) {
      emit(state.copyWith(messages: event.messages));
    });

    _messagesStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map(
          (maps) => maps
              .map(
                (map) => Message.fromMap(
                  map,
                  supabase.auth.currentUser!.id,
                ),
              )
              .toList(),
        );

    _messagesStream.listen((messages) {
      add(PrivateChatLoadMessages(messages: messages));
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }

  late final Stream<List<Message>> _messagesStream;
}
