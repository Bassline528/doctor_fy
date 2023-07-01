// ignore_for_file: lines_longer_than_80_chars

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:doctor_fy/core/helpers/extensions/context_extensions.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:swipe_to/swipe_to.dart';

enum AttachmentType { image, video, file, location }

class PrivateChatScreen extends StatelessWidget {
  const PrivateChatScreen({
    super.key,
  });
  static const String routeName = 'chat';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: PrivateChatView(),
    );
  }
}

class PrivateChatView extends StatefulWidget {
  const PrivateChatView({
    super.key,
  });

  @override
  State<PrivateChatView> createState() => _PrivateChatViewState();
}

class _PrivateChatViewState extends State<PrivateChatView> {
  late TextEditingController _messageController;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  bool isReplying = false;

  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Dr. Juan Perez',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.ellipsisVertical,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatInitial) {
                  context.loaderOverlay.show();
                } else {
                  context.loaderOverlay.hide();
                }

                if (state is ChatError) {
                  context.showErrorSnackBar(message: state.message);
                }
              },
              builder: (context, state) {
                if (state is ChatEmpty) {
                  return Center(
                    child: Text(
                      'No hay mensajes',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (state is ChatLoaded) {
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        state.messages.length,
                        (index) => BubbleNormal(
                          text: state.messages[index].content,
                          color: state.messages[index].isMine
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.secondary,
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: context.theme.colorScheme.onPrimary,
                          ),
                          isSender: state.messages[index].isMine,
                        ),
                      )
                      // <Widget>[

                      // DateChip(
                      //   date: DateTime(now.year, now.month, now.day - 2),
                      //   color: context.theme.colorScheme.surface,
                      //   textStyle: TextStyle(
                      //     fontSize: 14.sp,
                      //     color: context.theme.colorScheme.onSurface,
                      //   ),
                      // ),
                      // BubbleNormalImage(
                      //   id: 'id001',
                      //   image: _image(),
                      //   color: context.theme.colorScheme.secondary,
                      //   delivered: true,
                      // ),
                      // BubbleNormalAudio(
                      //   color: context.theme.colorScheme.secondary,
                      //   duration: duration.inSeconds.toDouble(),
                      //   position: position.inSeconds.toDouble(),
                      //   playColor: context.theme.colorScheme.onSecondary,
                      //   isPlaying: isPlaying,
                      //   isLoading: isLoading,
                      //   isPause: isPause,
                      //   textStyle: TextStyle(
                      //     fontSize: 14.sp,
                      //     color: context.theme.colorScheme.onPrimary,
                      //   ),
                      //   onSeekChanged: _changeSeek,
                      //   onPlayPauseButtonClick: _playAudio,
                      //   sent: true,
                      // ),
                      // BubbleNormal(
                      //   text: 'Hola rey',
                      //   color: context.theme.colorScheme.primary,
                      //   textStyle: TextStyle(
                      //     fontSize: 14.sp,
                      //     color: context.theme.colorScheme.onPrimary,
                      //   ),
                      //   isSender: false,
                      // ),
                      // SwipeTo(
                      //   onRightSwipe: () {
                      //     setState(() {
                      //       isReplying = true;
                      //     });
                      //   },
                      //   child: BubbleNormal(
                      //     text: 'Hola que tal',
                      //     color: context.theme.colorScheme.secondary,
                      //     textStyle: TextStyle(
                      //       fontSize: 14.sp,
                      //       color: context.theme.colorScheme.onSecondary,
                      //     ),
                      //     delivered: true,
                      //     seen: true,
                      //     sent: true,
                      //   ),
                      // ),
                      // ],
                      ,
                    ),
                  );
                } else if (state is ChatError) {
                  return Center(child: Text(state.message));
                }
                throw UnimplementedError();
              },
            ),
          ),
          if (context.watch<ChatCubit>().state is ChatError)
            Container()
          else
            MessageBar(
              onSend: (text) {
                if (text.isNotEmpty) {
                  context.read<ChatCubit>().sendMessage(
                        _messageController.text,
                      );
                  _messageController.clear();
                }
              },
              onAudioPressed: () {
                print('audio pressed');
              },
              onTapCloseReply: () {
                setState(() {
                  isReplying = false;
                });
              },
              replying: isReplying,
              controller: _messageController,
              hintText: 'Escribe un mensaje',
              sendButtonColor: context.theme.colorScheme.primary,
              sendButtonIconColor: context.theme.colorScheme.onPrimary,
              replyWidgetColor: context.theme.colorScheme.surface,
              replyIconColor: context.theme.colorScheme.onSurface,
              replyCloseColor: context.theme.colorScheme.onSurface,
              messageBarColor: context.theme.colorScheme.surface,
              onTextChanged: (value) {
                setState(() {});
              },
              actions: [
                IconButton(
                  onPressed: _attachmentModal,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 20,
        minWidth: 20,
      ),
      child: CachedNetworkImage(
        imageUrl: 'https://i.ibb.co/JCyT1kT/Asset-1.png',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Future<void> _attachmentModal() {
    //show modal bottom sheet with options to send images, videos, etc
    final result = showModalActionSheet<AttachmentType>(
      context: context,
      actions: [
        const SheetAction(
          icon: Icons.image,
          label: 'Imagen',
          key: AttachmentType.image,
        ),
        const SheetAction(
          icon: Icons.image,
          label: 'Video',
          key: AttachmentType.video,
        ),
        const SheetAction(
          icon: Icons.image,
          label: 'Archivo',
          key: AttachmentType.file,
        ),
        const SheetAction(
          label: 'Localización',
          key: AttachmentType.location,
          icon: Icons.location_on,
        ),
      ],
    );

    return result.then((value) {
      switch (value) {
        case AttachmentType.image:
          //send image
          break;
        case AttachmentType.video:
          //send video
          break;
        case AttachmentType.file:
          //send file
          break;
        case AttachmentType.location:
          //send location
          break;
      }
    });
  }

  void _changeSeek(double value) {
    setState(() {
      audioPlayer.seek(Duration(seconds: value.toInt()));
    });
  }

  void _playAudio() async {
    const url =
        'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
    final source = UrlSource(url);
    if (isPause) {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await audioPlayer.play(source);
      setState(() {
        isPlaying = true;
      });
    }

    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
        isLoading = false;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = const Duration();
        position = const Duration();
      });
    });
  }
}
