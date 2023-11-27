import 'package:chatgpt_api_study_231126/widgets/text_widget.dart';
import 'package:flutter/material.dart';

Color scaffolodBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

List<String> models = [
  "Model1",
  "Model2",
  "Model3",
  "Model4",
  "Model5",
  "Model6",
];

List<DropdownMenuItem<String>>? get getModelsItem {
  List<DropdownMenuItem<String>>? modelsItems =
      List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
              value: models[index],
              child: TextWidget(
                label: models[index],
                fontsize: 15,
              )));
  return modelsItems;
}

final chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg": "Hello who are you?",
    "chatIndex": 1,
  },
  {
    "msg": "Hello who are old you_____________________?",
    "chatIndex": 0,
  },
  {
    "msg": "do you like?",
    "chatIndex": 1,
  },
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg": "Hello who are you?",
    "chatIndex": 1,
  }
];
