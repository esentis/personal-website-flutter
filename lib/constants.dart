import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

enum kLocale { greek, english }

enum kTheme { light, dark }

class ContactCursor extends MaterialStateMouseCursor {
  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return SystemMouseCursors.forbidden;
    }
    return SystemMouseCursors.click;
  }

  @override
  String get debugDescription => 'ListTileCursor()';
}

Future<void> launchLink(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Color kColorMain = const Color(0xffE7D9EA);

Color kColorBackground = Color.fromARGB(255, 33, 33, 72);

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
  required String text,
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

SelectableText kSelectableText({
  required String text,
  double fontSize = 17,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w100,
  TextAlign textAlign = TextAlign.left,
}) =>
    SelectableText(
      text,
      textAlign: textAlign,
      style: GoogleFonts.tinos(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

Text kText({
  required String text,
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
