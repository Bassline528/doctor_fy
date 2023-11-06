import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:doctor_fy/core/constants/constants.dart';
import 'package:doctor_fy/features/chat/data/entities/message.dart';
import 'package:doctor_fy/features/chat/presentation/blocs/cubit/chat_cubit.dart';
import 'package:doctor_fy/features/chat/presentation/screens/private_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

Future<void> attachmentModal(BuildContext context) {
  //show modal bottom sheet with options to send images, videos, etc
  final result = showModalActionSheet<AttachmentType>(
    context: context,
    actions: [
      const SheetAction(
        icon: FontAwesomeIcons.image,
        label: 'Imagen',
        key: AttachmentType.image,
      ),
      const SheetAction(
        icon: FontAwesomeIcons.video,
        label: 'Video',
        key: AttachmentType.video,
      ),
      const SheetAction(
        icon: FontAwesomeIcons.file,
        label: 'Documento',
        key: AttachmentType.file,
      ),
    ],
  );

  return result.then((value) {
    switch (value) {
      case AttachmentType.image:
        _handleImageSelection(context);
        break;
      case AttachmentType.video:
        //send video
        break;
      case AttachmentType.file:
        //send file
        break;
    }
  });
}

void _handleImageSelection(BuildContext context) async {
  final result = await ImagePicker().pickImage(
    imageQuality: 70,
    maxWidth: 1440,
    source: ImageSource.gallery,
  );

  if (result != null) {
    final bytes = await result.readAsBytes();
    final image = await decodeImageFromList(bytes);

    final file = File(result.path);

    Uuid uuid = Uuid();

    final fileName = '${uuid.v4()}.jpg';

    final storageResult =
        await supabase.storage.from('chat_images/private').upload(
              fileName,
              file,
              fileOptions: const FileOptions(
                upsert: true,
              ),
            );

    context.read<ChatCubit>().sendMessage(
          storageResult.substring(storageResult.indexOf('/') + 1),
          MessageType.imagen,
        );
  }
}
