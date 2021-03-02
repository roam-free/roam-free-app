import 'package:roam_free/ui/views/new_host_bottom_sheet/new_host_bottom_sheet_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class NewHostBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const NewHostBottomSheetView({
    Key key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewHostBottomSheetViewModel>.reactive(
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
            model.generateSelection(context),
          ],
        ),
      ),
      viewModelBuilder: () => NewHostBottomSheetViewModel(),
    );
  }
}
