import 'package:flutter/material.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

class AppMenu extends StatefulWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  _AppMenuState createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                //Update app state
                print('Item 1 pressed');
                widget._navigationService.popRepeated(1);
                widget._navigationService.navigateTo(Routes.homeView);
              }),
          ListTile(
              title: Text('User Accounts'),
              onTap: () {
                widget._navigationService.popRepeated(1);
                widget._navigationService.navigateTo(Routes.userAccountView);
                print('item 2 pressed');
              }),
        ],
      ),
    );
  }
}
