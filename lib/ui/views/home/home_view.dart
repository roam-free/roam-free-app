import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/ui/views/host/host_view.dart';
import 'package:roam_free/ui/widgets/location_box/location_box_view.dart';
import 'package:roam_free/ui/widgets/menu/menu_view.dart';
import 'package:roam_free/ui/widgets/host_card.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/home/home_view_model.dart';
import 'package:roam_free/ui/widgets/nav_bar/nav_bar_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        key: model.drawerKey,
        appBar: AppBar(title: Text('Roam Free')),
        drawer: MenuView(),
        body: Column(
          children: [
            LocationBoxView(model.drawerKey),
            Expanded(
              child: StreamBuilder<List<Host>>(
                stream: model.hostsStream,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Host>> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Snapshot Error: ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading...');
                    default:
                      if (snapshot.hasData) {
                        return ListView(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            children: snapshot.data.map((Host host) {
                              host.calculateDistance(model.getUserPosition());
                              return HostCard(
                                title: host.name,
                                subtitle: host.location,
                                image: CachedNetworkImage(
                                  imageUrl: host.images[0],
                                  fit: BoxFit.fill,
                                  height: 350,
                                ),
                                bottomLine:
                                    '${host.distance.toStringAsFixed(2)} km',
                                onPressed: () {
                                  print('${host.name} tapped.');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HostView(host)),
                                  );
                                },
                              );
                            }).toList());
                      } else {
                        //TODO Better no data message
                        return Text('No Data');
                      }
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
