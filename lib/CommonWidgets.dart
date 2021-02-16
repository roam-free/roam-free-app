import 'package:flutter/material.dart';
import 'package:roam_free/UserAccounts.dart';
import 'Home.dart';
import 'EditHostsPage.dart';

// App Drawer
class AppDrawer extends StatelessWidget {
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
                if (ModalRoute.of(context)?.settings?.name != UserLogin.id)
                  Navigator.pushNamed(context, UserLogin.id);
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
                Navigator.pop(context);
                if (ModalRoute.of(context)?.settings?.name != Home.id)
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Home.id, (Route<dynamic> route) => false);
              }),
          ListTile(
              title: Text('Edit Hosts'),
              onTap: () {
                //Update app state
                print('item 2 pressed');
                Navigator.pop(context);
                if (ModalRoute.of(context)?.settings?.name != EditHostsPage.id)
                  Navigator.of(context).pushNamed(EditHostsPage.id);
              }),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings?.name != Home.id)
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Home.id, (Route<dynamic> route) => false);
            },
            child: Icon(Icons.home, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }
}
