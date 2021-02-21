import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HostViewModel extends BaseViewModel {
  Future<void> callNow(number) async {
    String url = 'tel:$number';
    await launch(url);
  }

  Future<void> emailNow(email) async {
    String url = 'mailto:$email';
    await launch(url);
  }
}
