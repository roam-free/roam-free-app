import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/widgets/nav_bar/nav_bar_view_model.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavBarViewModel>.reactive(
      viewModelBuilder: () => NavBarViewModel(),
      builder: (context, model, child) => Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                if (ModalRoute.of(context).settings.name != '/home-view')
                  model.navigateToHome();
              },
              child: Icon(Icons.home, color: Colors.white, size: 40),
            ),
            FlatButton(
              onPressed: () {
                if (ModalRoute.of(context).settings.name != '/search-view')
                  model.navigateToSearch();
              },
              child: Icon(Icons.search, color: Colors.white, size: 40),
            ),
            FlatButton(
              onPressed: () {
                if (ModalRoute.of(context).settings.name !=
                    '/user-account-view') model.navigateToUserAccount();
              },
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
