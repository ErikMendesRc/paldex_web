import 'package:paldex/config/api_config.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static launchURL() async {
    final Uri url = Uri.parse(ApiConfig.urlDonate);
    if (!await launchUrl(url)) {
      return;
    }
  }
}
