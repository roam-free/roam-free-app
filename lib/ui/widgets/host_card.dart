import 'package:flutter/material.dart';

class HostCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final Widget image;
  final String bottomLine;
  final Function onPressed;

  const HostCard({
    @required this.title,
    @required this.subtitle,
    @required this.image,
    @required this.bottomLine,
    this.onPressed,
  });

  @override
  _HostCardState createState() => _HostCardState();
}

class _HostCardState extends State<HostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: widget.onPressed,
        splashColor: Colors.blue.withAlpha(30),
        child: Container(
          width: 300,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Text(widget.title),
                subtitle: Text(widget.subtitle),
              ),
              widget.image,
              ListTile(
                title: Text(widget.bottomLine),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
