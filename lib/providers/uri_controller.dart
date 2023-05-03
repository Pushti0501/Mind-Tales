import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Launch extends ChangeNotifier{

launchURL(String link) async {
    // ignore: avoid_print
    print(link);
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
    notifyListeners();
  }

}