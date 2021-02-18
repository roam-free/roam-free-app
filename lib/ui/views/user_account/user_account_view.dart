import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/user_account/user_account_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';

import '../../widgets/busy_button.dart';

class UserAccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BusyButton(
                  title: 'Sign Out',
                  onPressed: () {
                    model.signOut();
                  },
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: NavBarView(),
      ),
    );
  }
}
