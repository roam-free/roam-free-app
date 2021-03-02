import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/user_account/user_account_view_model.dart';
import 'package:stacked/stacked.dart';

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
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(model.getName()),
                  ),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(model.getEmail()),
                  ),
                  ListTile(
                    title: Text('Location'),
                    subtitle: Text('${model.getLocation()}'),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: model.adminPanel,
      ),
    );
  }
}
