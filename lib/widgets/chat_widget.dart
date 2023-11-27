import 'package:chatgpt_api_study_231126/constrants/constans.dart';
import 'package:chatgpt_api_study_231126/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatindex});
  final String msg;
  final int chatindex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatindex == 0 ? scaffolodBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  chatindex == 0 ? Icons.thunderstorm : Icons.computer,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextWidget(label: msg),
                ),
                chatindex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          ),
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
