import 'package:roam_free/ui/views/filters/filters_view.dart';
import 'package:roam_free/app/locator.dart';
import 'package:roam_free/enums/bottom_sheet_type.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.filters: (context, sheetRequest, completer) => FiltersView(
          request: sheetRequest,
          completer: completer,
        )
  };

  _bottomSheetService.setCustomSheetBuilders(builders);
}
