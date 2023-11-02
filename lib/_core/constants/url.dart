import 'package:url_launcher/url_launcher.dart';

Future<void> URLLink(String moveURL) async {
  print("URLLink 실행됨");
  if (!await launchUrl(Uri.parse("${moveURL}"))) {
    print("URLLink 실행되면안됨");
    throw Exception("Could not launch ${moveURL}");
  }
}
