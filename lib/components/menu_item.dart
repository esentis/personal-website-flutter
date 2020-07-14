import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
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
        style: GoogleFonts.gfsNeohellenic(
          fontSize: 30,
          color: color,
        ),
      ),
    );
  }
}
