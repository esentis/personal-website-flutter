import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.red.withOpacity(0.2),
            child: PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 17,
              color: Colors.red,
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
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                color: Colors.red.withOpacity(0.3),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
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
                          'Page Not Found',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 50,
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
  }
}
