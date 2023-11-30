import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

Logger kLog = Logger();

Future<void> launchLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Color imessageColor = const Color(0xFF1F8AFF);
Color imessageColor2 = const Color(0xFF26252a);
Color imessageProfileDetailsBackgroundColor = const Color(0xFF1c1c1e);
TextStyle chatStyle = const TextStyle(
  fontFamily: 'SFProDisplay',
  fontSize: 18,
  color: Colors.white,
);
