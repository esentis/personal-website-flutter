import 'package:esentispws/pages/desktop/contact.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

enum kLocale { greek, english }

enum kTheme { light, dark }

Future<void> launchLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Color kColorMain = const Color(0xffE7D9EA);

Color kColorBackground = const Color(0xff0d47a1);

Color kColorHomeBackground = const Color(0xff67b6f6);

Color kColorPortfolioBackground = const Color(0xff67b6f6);

Color kColorContactBackground = const Color(0xffE63E6D);

ButtonStyle kButtonStyleDefault = ButtonStyle(
  mouseCursor: ContactCursor(),
  overlayColor: MaterialStateProperty.resolveWith(
    (states) => kColorMain.withOpacity(0.2),
  ),
  backgroundColor: MaterialStateProperty.resolveWith(
    (states) => kColorBackground,
  ),
);

Text kTitle({
  String text,
  double fontSize = 35,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w100,
  TextAlign textAlign = TextAlign.left,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.commissioner(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

Text kText({
  String text,
  double fontSize = 17,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w100,
  TextAlign textAlign = TextAlign.left,
}) =>
    Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.tinos(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

Logger kLog = Logger();

TextStyle kStyleDefault = GoogleFonts.commissioner(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.w100,
);
