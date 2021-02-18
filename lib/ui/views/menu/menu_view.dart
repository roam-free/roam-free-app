import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/menu/menu_view_model.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, model, child) => Drawer(
        child: ListView(
          // Important: Remove any padding from ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: FlatButton(
                child: Text('Login'),
                onPressed: () {
                  //TODO Account management here
                },
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
                title: Text('Home'),
                onTap: () {
                  if (ModalRoute.of(context).settings.name != '/home-view')
                    model.navigateToHome();
                }),
          ],
        ),
      ),
    );
  }
}
