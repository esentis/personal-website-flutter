import 'package:flutter/material.dart';

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
    return Container(
      width: 100,
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Image.asset(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
