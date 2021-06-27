import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = PageController(initialPage: 0);
int currentIndex = 0;
var logger = Logger();

enum screens {
  // ignore: constant_identifier_names
  HOME,
  // ignore: constant_identifier_names
  PORTFOLIO,
  // ignore: constant_identifier_names
  CONTACT
}

class LandingPageDesktop extends StatefulWidget {
  @override
  _LandingPageDesktopState createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop>
    with TickerProviderStateMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentScreen = screens.HOME;

  final PageController _pageController = PageController();

  Animation<double> size;

  bool isDrawerOpen = false;
  bool globalTapToDismiss = false;
  bool isLoading = true;

  double width = 250;
  double height = 250;

  double fontSize = 45;
  double copyRightFontSize = 20;

  double nameAngle = 0;
  double titleAngle = 0;

  double angle = 0;
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
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          toolbarHeight: 140,
          centerTitle: true,
          backgroundColor: kColorBackground,
          forceElevated: true,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kColorMain,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        kTitle(text: 'George ', color: kColorMain),
                        kTitle(
                            text: 'Leonidis ',
                            fontWeight: FontWeight.bold,
                            color: kColorMain),
                      ],
                    ),
                  ),
                ),
              ),
              kText(
                  text: 'Software Developer',
                  fontSize: 20,
                  color: kColorMain,
                  fontWeight: FontWeight.bold),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          await _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        },
                        child: kText(
                          text: 'Home',
                          color: kColorMain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          await _pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        },
                        child: kText(
                          text: 'Portfolio',
                          color: kColorMain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () async {
                          await _pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        },
                        child: kText(
                          text: 'Contact',
                          color: kColorMain,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - kToolbarHeight - 85,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Scaffold(
                  backgroundColor: kColorBackground,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                          style: GoogleFonts.tinos(
                            fontSize: 50,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                'Hello and welcome...',
                                speed: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                textStyle: GoogleFonts.tinos(
                                  fontSize: 25,
                                  color: kColorMain,
                                ),
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print('Tap Event');
                            },
                          ),
                        ),
                        Flexible(
                          child: Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_9unpvaft.json'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          },
                          child: kText(
                            text: 'Check my work ',
                            color: kColorMain,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Scaffold(
                  backgroundColor: kColorBackground,
                  body: PortfolioPage(),
                ),
                Scaffold(
                  backgroundColor: kColorPageBackground,
                  body: ContactInfo(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
