import 'package:flutter/material.dart';
import 'package:roam_free/ui/shared/shared_styles.dart';

class InputFieldMultiline extends StatelessWidget {
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final String placeholder;

  const InputFieldMultiline({
    @required this.controller,
    @required this.placeholder,
    this.minLines = 4,
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: fieldDecortaion,
          child: TextField(
            keyboardType: TextInputType.multiline,
            minLines: minLines,
            maxLines: maxLines,
            controller: controller,
            decoration: InputDecoration.collapsed(
              hintText: placeholder,
              hintStyle: TextStyle(fontSize: 15),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
