import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/models/host.dart';
import 'package:roam_free/ui/views/nav_bar/nav_bar_view.dart';
import 'package:roam_free/ui/widgets/icon_text_button.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'host_view_model.dart';

// class HostView extends StatelessWidget {
//   final Host host;

//   HostView(this.host);

//   Completer<GoogleMapController> _controller = Completer();
// // 2
//   static final CameraPosition _myLocation = CameraPosition(
//     target: LatLng(0, 0),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         children: [
//           Container(
//             child: GoogleMap(
//               initialCameraPosition: _myLocation,
//               onMapCreated: (GoogleMapController controller) {
//                 _controller.complete(controller);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HostView extends StatelessWidget {
  final Host host;

  HostView(this.host);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HostViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(host.name)),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(),
                child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: host.images[0],
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  host.name,
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  host.location,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text("Description"),
                subtitle: Text(host.description),
              ),
              IconTextButton(
                color: Colors.greenAccent[400],
                onPressed: () => model.callNow(host.phone),
                icon: Icon(Icons.phone),
                text: "Phone Now",
              ),
              SizedBox(
                height: 10,
              ),
              IconTextButton(
                onPressed: () => model.emailNow(host.email),
                icon: Icon(Icons.email),
                text: "Email Now",
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavBarView(),
      ),
      viewModelBuilder: () => HostViewModel(),
    );
  }
}
