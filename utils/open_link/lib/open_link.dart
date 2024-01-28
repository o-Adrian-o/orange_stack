library open_link;

import 'package:url_launcher/url_launcher.dart';

openLink(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    // TODO: Log error.
  }
}