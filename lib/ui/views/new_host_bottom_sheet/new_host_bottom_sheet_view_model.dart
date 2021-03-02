import 'package:roam_free/services/filter_service.dart';
import 'package:stacked/stacked.dart';

class NewHostBottomSheetViewModel extends BaseViewModel {
  FiltersType _ref;
  Function _updateSelectedCallback;

  void initialise(customData) {
    _ref = customData['ref'];
    _updateSelectedCallback = customData['callback'];
  }
}
