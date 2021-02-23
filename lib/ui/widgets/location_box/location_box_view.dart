import 'package:flutter/material.dart';
import 'package:roam_free/ui/widgets/location_box/location_box_view_model.dart';
import 'package:stacked/stacked.dart';

class LocationBoxView extends StatelessWidget {
  final GlobalKey<ScaffoldState> homeKey;
  final Function updateDistance;

  LocationBoxView(this.updateDistance, this.homeKey);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationBoxViewModel>.reactive(
      onModelReady: (model) => model.initialise(updateDistance),
      builder: (context, model, child) => FlatButton(
        onPressed: () async {
          model.searchPlaces(context);
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(model.padding),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_pin),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          model.locationText,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.filter_alt_rounded),
                onPressed: () => model.openFilterDrawer(homeKey),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LocationBoxViewModel(),
    );
  }
}
