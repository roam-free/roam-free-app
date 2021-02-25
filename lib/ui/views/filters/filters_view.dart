import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/filter_spin/filters_spin_view.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:roam_free/ui/views/filter_box/filter_box_view.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/filters/filters_view_model.dart';

class FiltersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return FlatButton(
                  child: const Text('Clear Filters'),
                  textColor: Theme.of(context).buttonColor,
                  onPressed: () async {
                    model.clearFilters(context);
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            FilterSpinView(
              title: 'Distance \(km\)',
              filtersRef: FiltersType.distances,
            ),
            const Divider(),
            FilterBoxView(
              title: 'Services',
              filtersRef: FiltersType.services,
            ),
            const Divider(),
          ],
        ),
      ),
      viewModelBuilder: () => FiltersViewModel(),
    );
  }
}
