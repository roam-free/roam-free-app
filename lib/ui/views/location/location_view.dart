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
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 105,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: InputField(
                      controller: model.newLocationController,
                      placeholder: 'Enter a new Location here',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      await model.updateLocationListView();
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (model.locations.isEmpty == false) {
                    print('bool: ${model.locations}');
                    return ListTile(
                      title: Text(
                        '${model.locations[index]}',
                      ),
                    );
                  } else {
                    //TODO add previous searches here
                    return null;
                  }
                },
              ),
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
