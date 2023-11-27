import 'package:chatgpt_api_study_231126/constrants/constans.dart';
import 'package:flutter/material.dart';

class ModelsDropdownWidget extends StatefulWidget {
  const ModelsDropdownWidget({super.key});

  @override
  State<ModelsDropdownWidget> createState() => _ModelsDropdownWidgetState();
}

class _ModelsDropdownWidgetState extends State<ModelsDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    String currentModel = "Model1";
    return DropdownButton(
        dropdownColor: scaffolodBackgroundColor,
        items: getModelsItem,
        value: currentModel,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        });
  }
}
