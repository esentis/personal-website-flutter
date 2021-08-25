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

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = PageController();
int currentIndex = 0;

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

  screens currentScreen = screens.HOME;

  PageController _pageController;

  double currentPage = 0;

  Animation<double> size;

  bool isDrawerOpen = false;
  bool globalTapToDismiss = false;
  bool isLoading = true;

  // double width = 250;
  // double height = 250;

  double fontSize = 45;
  double copyRightFontSize = 20;

  double nameAngle = 0;
  double titleAngle = 0;

  double scale = 1;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 140,
              centerTitle: true,
              shadowColor: Colors.grey.withOpacity(0.5),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentScreen == screens.HOME
                                    ? kColorHomeBackground
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: kText(
                                  text: 'Home',
                                  color: currentScreen == screens.HOME
                                      ? kColorBackground
                                      : kColorMain,
                                  fontSize: 19,
                                ),
                              ),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentScreen == screens.PORTFOLIO
                                    ? kColorHomeBackground
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: kText(
                                  text: 'Portfolio',
                                  color: kColorMain,
                                  fontSize: 19,
                                ),
                              ),
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
                            child: Container(
                              decoration: BoxDecoration(
                                color: currentScreen == screens.CONTACT
                                    ? kColorHomeBackground
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                ),
                                child: kText(
                                  text: 'Contact',
                                  color: kColorMain,
                                  fontSize: 19,
                                ),
                              ),
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
              child: SizedBox(
                width: double.infinity,
                height:
                    MediaQuery.of(context).size.height - kToolbarHeight - 135,
                child: PageView(
                  onPageChanged: (page) {
                    if (page == 0) {
                      setState(() {
                        currentScreen = screens.HOME;
                      });
                    } else if (page == 1) {
                      setState(() {
                        currentScreen = screens.PORTFOLIO;
                      });
                    } else {
                      setState(() {
                        currentScreen = screens.CONTACT;
                      });
                    }
                  },
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Scaffold(
                      backgroundColor: kColorHomeBackground,
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.tinos(
                                fontSize: 50,
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'Hello and Welcome...!',
                                    speed: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    textStyle: GoogleFonts.tinos(
                                      fontSize: 25,
                                      color: kColorBackground,
                                    ),
                                  ),
                                ],
                                onTap: () {
                                  kLog.i('Tap Event');
                                },
                              ),
                            ),
                            Flexible(
                              child: MouseRegion(
                                onEnter: (h) {
                                  kLog.wtf('hovvering $h');

                                  setState(() {
                                    scale = 1.2;
                                  });
                                },
                                onExit: (h) {
                                  kLog.wtf('hovvering $h');

                                  setState(() {
                                    scale = 1;
                                  });
                                },
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await _pageController.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        kColorHomeBackground,
                                      ),
                                      elevation: MaterialStateProperty.all(
                                        0,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        kColorHomeBackground,
                                      )),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                    transform: Matrix4.identity()..scale(scale),
                                    child: Lottie.network(
                                        'https://assets5.lottiefiles.com/packages/lf20_foZ22A.json'),
                                  ),
                                ),
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
                      backgroundColor: kColorHomeBackground,
                      body: ContactInfo(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Material(
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kColorBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(1, 1),
                    spreadRadius: 2,
                  )
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  launchLink('https://www.github.com/esentis');
                },
                child: Center(
                  child: kTitle(
                    text: 'esentis © ${DateTime.now().year}',
                    color: kColorMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
