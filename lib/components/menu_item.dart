import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    this.onPress,
    this.text,
    this.color,
  });
  final Function onPress;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress,
      child: Text(
        text,
        style: GoogleFonts.openSansCondensed(
          fontSize: 30,
          color: color,
        ),
      ),
    );
  }
}
