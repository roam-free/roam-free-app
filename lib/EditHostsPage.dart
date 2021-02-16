import 'package:flutter/material.dart';
import 'CommonWidgets.dart';

// Edit Hosts
class EditHostsPage extends StatelessWidget {
  static const String id = 'editHostsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roam Free')),
      drawer: AppDrawer(),
      body: Text('Edit Hosts'),
      bottomNavigationBar: NavBar(),
    );
  }
}
