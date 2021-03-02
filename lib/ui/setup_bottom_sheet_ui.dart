import 'package:roam_free/ui/views/filter_bottom_sheet/filter_bottom_sheet_view.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';
import 'package:roam_free/ui/views/new_host_bottom_sheet/new_host_bottom_sheet_view.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.filters: (context, sheetRequest, completer) =>
        FilterBottomSheetView(request: sheetRequest, completer: completer),
    BottomSheetType.newHost: (context, sheetRequest, completer) =>
        NewHostBottomSheetView(request: sheetRequest, completer: completer),
  };

  _bottomSheetService.setCustomSheetBuilders(builders);
}
