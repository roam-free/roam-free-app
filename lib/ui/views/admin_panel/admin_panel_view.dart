import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/admin_panel/admin_panel_view_model.dart';
import 'package:stacked/stacked.dart';

class AdminPanelView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminPanelViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: ListView(
          children: [
            FlatButton(
              onPressed: () => model.addNewHost(),
              child: Text('Add New Host'),
              color: Colors.greenAccent[100],
            ),
            FlatButton(
              onPressed: () => model.manageHosts(),
              child: Text('Manage Hosts'),
              color: Colors.greenAccent[100],
            ),
          ],
        ),
      ),
      viewModelBuilder: () => AdminPanelViewModel(),
    );
  }
}
