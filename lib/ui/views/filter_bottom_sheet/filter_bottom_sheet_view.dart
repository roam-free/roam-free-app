import 'package:flutter/material.dart';
import 'package:roam_free/ui/views/filter_bottom_sheet/filter_bottom_sheet_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FilterBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const FilterBottomSheetView({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterBottomSheetViewModel>.reactive(
      onModelReady: (model) => model.initialise(request.customData),
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
              request.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 10),
            model.generateFilters(context),
          ],
        ),
      ),
      viewModelBuilder: () => FilterBottomSheetViewModel(),
    );
  }
}
