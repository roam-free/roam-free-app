import 'package:flutter/material.dart';

class IconTextButton extends StatefulWidget {
  final Icon icon;
  final String text;
  final Color color;
  final Function onPressed;

  const IconTextButton({
    @required this.icon,
    @required this.text,
    this.color = Colors.white,
    @required this.onPressed,
  });

  @override
  _IconTextButtonState createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          color: widget.color,
          child: Row(
            children: [
              widget.icon,
              Text(
                "  ${widget.text}",
                style:
                    TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
