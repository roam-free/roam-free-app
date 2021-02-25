import 'package:flutter/material.dart';
import 'package:roam_free/enums/filters_type.dart';
import 'package:stacked/stacked.dart';
import 'filter_box_view_model.dart';

// ignore: must_be_immutable
class FilterBoxView extends StatelessWidget {
  String title;
  FiltersType filtersRef;
  ImageProvider image;

  FilterBoxView({
    @required this.title,
    @required this.filtersRef,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterBoxViewModel>.reactive(
      onModelReady: (model) => model.initialise(title, image, filtersRef),
      builder: (context, model, child) => FlatButton(
        onPressed: () => model.onPressed(),
        onLongPress: () => model.onLongPressed(),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: model.image,
              ),
              Expanded(
                child: ListTile(
                  title: Text(model.title),
                  subtitle: Text(model.subtitle),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => FilterBoxViewModel(),
    );
  }
}
