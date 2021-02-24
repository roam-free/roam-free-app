import 'package:roam_free/app/locator.dart';
import 'package:roam_free/models/filter.dart';
import 'package:roam_free/services/home_service.dart';
import 'package:stacked/stacked.dart';

class FiltersViewModel extends BaseViewModel {
  final HomeService _homeService = locator<HomeService>();

  void initialise() {}

  List<Filter> getFilters() {
    return _homeService.filters;
  }

  void setFilterDistance(value) {
    print("filter: setting distance filter value");
    getFilters()[0].value = value;
  }

  void refreshHome() {
    _homeService.refreshHome();
  }
}
