import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:roam_free/ui/views/filters/filters_view_model.dart';

class FiltersView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const FiltersView({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filters',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Distance \(km\)'),
              subtitle: SpinBox(
                onChanged: (double value) => model.setFilterDistance(value),
                value: model.getFilters()[0].value,
                min: 0,
                max: 1000,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () => completer(SheetResponse(confirmed: true)),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    model.refreshHome();
                    completer(SheetResponse(confirmed: true));
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        ),
      ),
      viewModelBuilder: () => FiltersViewModel(),
    );
  }
}
