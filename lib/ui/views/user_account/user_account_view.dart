import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/user_account/user_account_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';

class UserAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserAccountViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return FlatButton(
                  child: const Text('Sign out'),
                  textColor: Theme.of(context).buttonColor,
                  onPressed: () async {
                    if (model.signOut() == false) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                        content: Text('No one has signed in.'),
                      ));
                    }
                  },
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  Text('Name: ${model.getName()}'),
                  Text('Email: ${model.getEmail()}'),
                  Text('Location: ${model.getLocation()}'),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: NavBarView(),
      ),
    );
  }
}
