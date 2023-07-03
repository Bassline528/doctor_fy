import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/core/helpers/extensions/context_extensions.dart';
import 'package:doctor_fy/core/widgets/no_data.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/cubit/chat_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/profiles/profiles_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/rooms/rooms_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/screens/categorias_screens.dart';
import 'package:doctor_fy/features/user/data/entities/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart';

class ConsultasScreen extends StatelessWidget {
  const ConsultasScreen({super.key});

  static const String routeName = 'consultas';

  @override
  Widget build(BuildContext context) {
    return RoomsView();
  }
}

class RoomsView extends StatelessWidget {
  const RoomsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/${CategoriasScreen.routeName}');
        },
        child: const FaIcon(FontAwesomeIcons.paperPlane),
      ),
      body: BlocConsumer<RoomCubit, RoomState>(
        listener: (context, state) {
          if (state is RoomsError) {
            context.showErrorSnackBar(message: state.message);
          }
        },
        builder: (context, state) {
          if (state is RoomsEmpty) {
            final newUsers = state.newUsers;
            return Column(
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: _NewUsers(newUsers: newUsers),
                // ),
                Expanded(
                  child: const NoDataToShow(
                    noDataText:
                        'No hay chats disponibles, empieza una consulta!',
                    child: Icon(
                      Icons.chat_bubble_outlined,
                      size: 100,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RoomsLoading) {
            return preloader;
          } else if (state is RoomsError) {
            return const NoDataToShow(
              noDataText: 'Ocurrio un error al cargar los chats',
              child: Icon(
                Icons.error_outline,
                size: 100,
              ),
            );
          } else if (state is RoomsLoaded) {
            final newUsers = state.newUsers;
            final rooms = state.rooms;
            return BlocBuilder<ProfilesCubit, ProfilesState>(
              builder: (context, state) {
                if (state is ProfilesLoaded) {
                  final profiles = state.profiles;
                  return Column(
                    children: [
                      // _NewUsers(newUsers: newUsers),
                      Expanded(
                        child: ListView.builder(
                          itemCount: rooms.length,
                          itemBuilder: (context, index) {
                            final room = rooms[index];
                            final otherUser = profiles[room.otherUserId];

                            return BlocProvider(
                              create: (context) => ChatCubit(),
                              child: ListTile(
                                onTap: () => context.push(
                                  '/chat/${room.id}',
                                  extra: [otherUser, context.read<ChatCubit>()],
                                ),
                                leading: CircleAvatar(
                                  child: otherUser == null
                                      ? preloader
                                      : Text(
                                          otherUser.username.substring(0, 2),
                                        ),
                                ),
                                title: Text(
                                  otherUser == null
                                      ? 'Cargando...'
                                      : otherUser.username,
                                ),
                                subtitle: room.lastMessage != null
                                    ? Text(
                                        room.lastMessage!.content,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : const Text('Chat creado'),
                                trailing: Text(
                                  format(
                                    room.lastMessage?.createdAt ??
                                        room.createdAt,
                                    locale: 'en_short',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return preloader;
                }
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class _NewUsers extends StatelessWidget {
  const _NewUsers({
    required this.newUsers,
  });

  final List<Profile> newUsers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: newUsers
            .map<Widget>(
              (user) => InkWell(
                onTap: () async {
                  try {
                    final roomId = await BlocProvider.of<RoomCubit>(context)
                        .createRoom(user.id);
                    // delay 300 miliseconds
                    await Future<void>.delayed(
                      const Duration(milliseconds: 300),
                    );
                    context.push(
                      '/chat/$roomId',
                    );
                  } catch (_) {
                    context.showErrorSnackBar(
                      message: 'Hubo un error al crear el chat',
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Text(user.username.substring(0, 2)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user.username,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
