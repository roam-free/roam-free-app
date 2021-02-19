import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/ui/views/menu/menu_view.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';
import 'package:stacked/stacked.dart';

import 'host_view_model.dart';

class HostView extends StatelessWidget {
  final Host host;

  HostView(this.host);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(host.name)),
        drawer: MenuView(),
        body: Container(
            child: Column(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: host.images[0],
              fit: BoxFit.fill,
              height: 350,
            ),
            Text(host.location)
          ],
        )),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => HostViewModel(),
    );
  }
}
