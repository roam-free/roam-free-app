import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddImageButton extends StatelessWidget {
  final Function onPressed;

  const AddImageButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      color: Colors.black,
      child: Container(
          width: 75,
          height: 75,
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 50,
            ),
            onPressed: onPressed,
          )),
      dashPattern: [5],
    );
  }
}
