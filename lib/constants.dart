import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

enum kLocale { greek, english }

enum kTheme { light, dark }

void launchLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Color kColorPurple = const Color(0xaf881cbd);
Color kColorBlueDark = const Color(0x442361e4);

TextStyle kStyleDefault = GoogleFonts.bebasNeue(
  color: Colors.white,
  fontSize: 35,
);

var kLog = Logger();
