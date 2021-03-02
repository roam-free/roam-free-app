import 'package:flutter/material.dart';
import 'package:roam_free/ui/shared/shared_styles.dart';

class SelectBox extends StatelessWidget {
  final String placeholder;
  final Function onPressed;
  final TextEditingController controller;

  const SelectBox({
    @required this.placeholder,
    @required this.onPressed,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: fieldDecortaion,
          child: TextField(
            controller: controller,
            onTap: onPressed,
            readOnly: true,
            keyboardType: TextInputType.streetAddress,
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
