import 'package:flutter/material.dart';
import 'Host.dart';
import 'CommonWidgets.dart';

class HostPage extends StatefulWidget {
  final Host host;

  const HostPage(this.host);

  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.host.name)),
      drawer: AppDrawer(),
      body: Container(
          child: Column(
        children: [
          Image.network(
            widget.host.images[0],
            fit: BoxFit.fill,
            height: 350,
          ),
          Text(widget.host.location)
        ],
      )),
      bottomNavigationBar: NavBar(),
    );
  }
}
