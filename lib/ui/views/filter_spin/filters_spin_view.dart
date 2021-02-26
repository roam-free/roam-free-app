import 'package:flutter/material.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'filters_spin_view_model.dart';

// ignore: must_be_immutable
class FilterSpinView extends StatelessWidget {
  String title;
  FiltersType filtersRef;
  ImageProvider image;

  FilterSpinView({
    @required this.title,
    @required this.filtersRef,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersSpinViewModel>.reactive(
      onModelReady: (model) => model.initialise(title, image, filtersRef),
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
                  onChanged: (double value) => model.onChanged(value),
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
