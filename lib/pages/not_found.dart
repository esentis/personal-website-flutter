import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const fontSize = 45.0;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: const Color(0xffF6F5F5),
          forceElevated: true,
          title: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: 'George',
                  style: GoogleFonts.commissioner(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w100,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Leonidis',
                      style: GoogleFonts.commissioner(
                        color: const Color(0xff726A95),
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floating: true,
        ),
      ],
    );
  }
}
