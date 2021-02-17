import 'package:flutter/material.dart';
import 'package:roam_free/ui/widgets/card_list.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/home/home_view_model.dart';
import 'package:roam_free/CommonWidgets.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Roam Free')),
        drawer: AppDrawer(),
        body: HostList(),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
