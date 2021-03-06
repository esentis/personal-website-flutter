import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:simple_animations/simple_animations.dart';

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = PageController(initialPage: 0);
int currentIndex = 0;
var logger = Logger();

class LandingPageDesktop extends StatefulWidget {
  @override
  _LandingPageDesktopState createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PlasmaRenderer(
                type: PlasmaType.infinity,
                particles: 17,
                color: const Color(0xaf881cbd),
                blur: 0.43,
                size: 0.39,
                speed: 1.64,
                offset: 1.57,
                blendMode: BlendMode.plus,
                variation1: 0,
                variation2: 0,
                variation3: 0,
                rotation: 0.04,
                fps: 34,
                child: PlasmaRenderer(
                  type: PlasmaType.infinity,
                  particles: 5,
                  color: const Color(0x442361e4),
                  blur: 0.4,
                  size: 1,
                  speed: 1,
                  offset: 0,
                  blendMode: BlendMode.plus,
                  variation1: 0,
                  variation2: 0,
                  variation3: 0,
                  rotation: 0,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: Text(
                                'George Leonidis',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Software Developer',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            'Coming soon',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '2021 ©',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
