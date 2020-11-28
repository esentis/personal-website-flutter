import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Skill extends StatelessWidget {
  const Skill({
    this.text,
    this.subtitle,
    this.image,
    this.fontSize,
    this.fontColor,
    this.shadowColor,
  });
  final String text;
  final String subtitle;
  final String image;
  final double fontSize;
  final Color fontColor;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Material(
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: ListTile(
          title: Text(
            text,
            style: GoogleFonts.gfsNeohellenic(
              fontSize: 20,
              color: fontColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.gfsNeohellenic(color: Colors.red, fontSize: 16),
          ),
          leading: Image.asset(image),
        ),
      ),
    );
  }
}
