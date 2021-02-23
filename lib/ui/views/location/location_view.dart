import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:roam_free/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';

import 'location_view_model.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              model.searchPlaces(context);
              print(model.prediction);
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: FlatButton(
            child: Center(
              child: Text('SAVE'),
            ),
            color: Colors.greenAccent[400],
            onPressed: () => model.saveLocation(),
          ),
        ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
