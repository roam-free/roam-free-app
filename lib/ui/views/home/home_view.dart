import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/models/Host.dart';
import 'package:roam_free/ui/views/host/host_view.dart';
import 'package:roam_free/ui/views/menu/menu_view.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/home/home_view_model.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Roam Free')),
        drawer: MenuView(),
        body: StreamBuilder<List<Host>>(
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
                        children: snapshot.data.map((Host host) {
                      print(host.images[0]);
                      return Card(
                        child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('${host.name} tapped.');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HostView(host)),
                              );
                            },
                            child: Container(
                              width: 300,
                              height: 500,
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ListTile(
                                      title: Text(host.name),
                                      subtitle: Text(host.location),
                                    ),
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          LinearProgressIndicator(),
                                      imageUrl: host.images[0],
                                      fit: BoxFit.fill,
                                      height: 350,
                                    ),
                                  ]),
                            )),
                      );
                    }).toList());
                  } else {
                    //TODO Better no data message
                    return Text('No Data');
                  }
              }
            }),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
