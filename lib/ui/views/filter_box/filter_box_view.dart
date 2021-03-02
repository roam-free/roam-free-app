import 'package:flutter/material.dart';
import 'package:roam_free/services/filter_service.dart';
import 'package:stacked/stacked.dart';
import 'filter_box_view_model.dart';

// ignore: must_be_immutable
class FilterBoxView extends StatelessWidget {
  FiltersType filtersRef;

  FilterBoxView({@required this.filtersRef});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterBoxViewModel>.reactive(
      onModelReady: (model) => model.initialise(filtersRef),
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
