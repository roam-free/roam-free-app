import 'package:flutter/material.dart';

class ServiceIcon extends StatefulWidget {
  final IconData icon;
  final String serviceName;
  final bool available;
  Color color;

  ServiceIcon({
    @required this.icon,
    @required this.serviceName,
    @required this.available,
  });

  @override
  _ServiceIconState createState() => _ServiceIconState();
}

class _ServiceIconState extends State<ServiceIcon> {
  @override
  Widget build(BuildContext context) {
    if (widget.available) {
      widget.color = Colors.black;
    } else {
      widget.color = Colors.grey[300];
    }
    return Column(
      children: [
        Icon(
          widget.icon,
          size: 70,
          color: widget.color,
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            widget.serviceName,
          ),
        ),
      ],
    );
  }
}
