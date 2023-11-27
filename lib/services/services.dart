import 'package:chatgpt_api_study_231126/constrants/constans.dart';
import 'package:chatgpt_api_study_231126/widgets/drop_down.dart';
import 'package:chatgpt_api_study_231126/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModelSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        backgroundColor: scaffolodBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: 'Chosen Model',
                    fontsize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: ModelsDropdownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
