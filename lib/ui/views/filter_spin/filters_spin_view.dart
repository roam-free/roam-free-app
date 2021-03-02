import 'package:flutter/material.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'filters_spin_view_model.dart';

// ignore: must_be_immutable
class FilterSpinView extends StatelessWidget {
  String filterId;
  FiltersType filtersRef;

  FilterSpinView({
    @required this.filterId,
    @required this.filtersRef,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersSpinViewModel>.reactive(
      onModelReady: (model) => model.initialise(filtersRef, filterId),
      builder: (context, model, child) => Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: model.image,
            ),
            Expanded(
              child: ListTile(
                title: Text(model.title),
                subtitle: SpinBox(
                  onChanged: (var value) => model.onChanged(value),
                  value: model.currentDistance,
                  min: 0,
                  max: 1000,
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => FiltersSpinViewModel(),
    );
  }
}
