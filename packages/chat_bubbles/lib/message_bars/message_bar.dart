import 'package:flutter/material.dart';

///Normal Message bar with more actions
///
/// following attributes can be modified
///
///
/// # BOOLEANS
/// [replying] is additional reply widget top of the message bar
///
/// # STRINGS
/// [replyingTo] is a string to tag the replying message
///
/// # WIDGETS
/// [actions] are the additional leading action buttons like camera
/// and file select
///
/// # COLORS
/// [replyWidgetColor] is reply widget color
/// [replyIconColor] is the reply icon color on the left side of reply widget
/// [replyCloseColor] is the close icon color on the right side of the reply
/// widget
/// [messageBarColor] is the color of the message bar
/// [sendButtonIconColor] is the color of the send button
///
/// # METHODS
/// [onTextChanged] is function which triggers after text every text change
/// [onSend] is send button action
/// [onTapCloseReply] is close button action of the close button on the
/// reply widget usually change [replying] attribute to `false`

class MessageBar extends StatelessWidget {
  final bool replying;
  final String replyingTo;
  final List<Widget> actions;
  final TextEditingController controller;
  final Color replyWidgetColor;
  final Color replyIconColor;
  final Color replyCloseColor;
  final Color messageBarColor;
  final Color sendButtonColor;
  final Color sendButtonIconColor;
  final String? hintText;
  final String? replyingToText;
  final void Function(String)? onTextChanged;
  final void Function(String)? onSend;
  final void Function()? onAudioPressed;
  final void Function()? onTapCloseReply;

  /// [MessageBar] constructor
  ///
  ///
  MessageBar({
    required this.controller,
    this.replying = false,
    this.replyingTo = "",
    this.actions = const [],
    this.replyWidgetColor = const Color(0xffF4F4F5),
    this.replyIconColor = Colors.blue,
    this.replyCloseColor = Colors.black12,
    this.messageBarColor = const Color(0xffF4F4F5),
    this.sendButtonColor = Colors.white,
    this.sendButtonIconColor = Colors.blue,
    this.onTextChanged,
    this.onSend,
    this.onTapCloseReply,
    this.hintText,
    this.replyingToText,
    this.onAudioPressed,
  });

  /// [MessageBar] builder method
  ///
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            replying
                ? Container(
                    color: replyWidgetColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: replyIconColor,
                          size: 24,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              replyingToText != null
                                  ? '$replyingToText: $replyingTo'
                                  : 'Re: ' + replyingTo,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onTapCloseReply,
                          child: Icon(
                            Icons.close,
                            color: replyCloseColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ))
                : Container(),
            replying
                ? Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  )
                : Container(),
            Container(
              color: messageBarColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: Row(
                children: <Widget>[
                  ...actions,
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: controller,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          hintText: hintText ?? "Type your message here",
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10),
                          hintStyle: TextStyle(
                            fontSize: 16,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              width: 0.2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              width: 0.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      backgroundColor: sendButtonColor,
                      child: controller.text.isEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.mic,
                                color: sendButtonIconColor,
                                size: 24,
                              ),
                              onPressed: () {
                                if (onAudioPressed != null) {
                                  onAudioPressed!();
                                }
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.send,
                                color: sendButtonIconColor,
                                size: 24,
                              ),
                              onPressed: () {
                                if (controller.text.trim() != '') {
                                  if (onSend != null) {
                                    onSend!(controller.text.trim());
                                  }
                                  controller.text = '';
                                }
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
