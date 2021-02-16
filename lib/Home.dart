import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CommonWidgets.dart';
import 'Repository.dart';
import 'Host.dart';
import 'HostPage.dart';

// Homepage
class Home extends StatelessWidget {
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roam Free')),
      drawer: AppDrawer(),
      body: HostList(),
      bottomNavigationBar: NavBar(),
    );
  }
}

// Builds list of hosts for the home page
class HostList extends StatefulWidget {
  @override
  _HostListState createState() => _HostListState();
}

class _HostListState extends State<HostList> {
  Stream<List<Host>> _hostsStream;

  @override
  void initState() {
    super.initState();
    _hostsStream = context.read<HostRepository>().getHosts();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Host>>(
        stream: _hostsStream,
        builder: (BuildContext context, AsyncSnapshot<List<Host>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Snapshot Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
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
                              builder: (context) => HostPage(host)),
                        );
                      },
                      child: Container(
                        width: 300,
                        height: 500,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ListTile(
                                title: Text(host.name),
                                subtitle: Text(host.location),
                              ),
                              Image.network(
                                host.images[0],
                                fit: BoxFit.fill,
                                height: 350,
                              )
                            ]),
                      )),
                );
              }).toList());
          }
        });
  }
}
