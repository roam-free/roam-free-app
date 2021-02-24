import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:roam_free/ui/widgets/menu/menu_view_model.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      viewModelBuilder: () => MenuViewModel(),
      builder: (context, model, child) => Drawer(
        child: ListView(
          // Important: Remove any padding from ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: FlatButton(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: model.profilePicture,
                      radius: 40,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(model.user.email),
                  ],
                ),
                onPressed: () {
                  model.navigateToUserAccount();
                },
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
