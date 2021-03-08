import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/animated_backgrounds.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

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

  ZoomDrawerController _zoomDrawerController;

  AnimationController _menuAnimationController;

  Animation<double> size;

  bool isDrawerOpen = false;
  bool globalTapToDismiss = false;

  double width = 350;
  double height = 150;

  double fontSize = 45;
  double copyRightFontSize = 20;

  double nameAngle = 0;
  double titleAngle = 0;

  double angle = 0;
  @override
  void initState() {
    super.initState();
    _zoomDrawerController = ZoomDrawerController();

    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    )..curve(Curves.easeInOut);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: Scaffold(
        backgroundColor: Colors.black,
        body: DrawerAnimatedBackground(
          menu: Stack(
            children: [
              Positioned(
                left: 100,
                top: 100,
                child: TextButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = screens.PORTFOLIO;
                      },
                    );
                  },
                  child: Text(
                    'Portfolio',
                    style: kStyleDefault,
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 200,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = screens.CONTACT;
                    });
                  },
                  child: Text(
                    'Contact',
                    style: kStyleDefault,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // slideWidth: 12,
      angle: 0,
      duration: const Duration(milliseconds: 900),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      style: DrawerStyle.Style1,

      mainScreen: Listener(
        onPointerDown: (event) {
          if (_zoomDrawerController.isOpen()) {
            logger.wtf('Closing drawer by global tap');
            setState(() {
              _zoomDrawerController.close();
              isDrawerOpen = false;
              _menuAnimationController.animateBack(0);
            });
          }
        },
        child: Scaffold(
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
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                transform: Matrix4.rotationY(nameAngle),
                                child: Center(
                                  child: Text(
                                    'George Leonidis',
                                    style: kStyleDefault,
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                child: Center(
                                  child: Text(
                                    'Software Developer',
                                    style: GoogleFonts.bebasNeue(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Drawer toggle button
                          Container(
                            width: 80,
                            height: 80,
                            child: IgnorePointer(
                              ignoring: isDrawerOpen,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (!_zoomDrawerController.isOpen()) {
                                      isDrawerOpen = true;
                                      _zoomDrawerController.open();
                                      _menuAnimationController.forward();
                                    }
                                  });
                                },
                                icon: AnimatedIcon(
                                  progress: _menuAnimationController,
                                  icon: AnimatedIcons.menu_close,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MouseRegion(
                              cursor: MouseCursor.uncontrolled,
                              onEnter: (event) {
                                // setState(() {
                                //   fontSize = 60;
                                //   width += 50;
                                //   angle = -1.25;
                                // });
                              },
                              onExit: (event) {
                                // setState(
                                //   () {
                                //     fontSize = 45;
                                //     width -= 50;
                                //     angle = 0;
                                //   },
                                // );
                              },
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5,
                                    sigmaY: 5,
                                  ),
                                  child: AnimatedContainer(
                                    transform: Matrix4.rotationY(angle)
                                      ..rotateZ(angle * 200),
                                    curve: Curves.easeInOut,
                                    width: isDrawerOpen
                                        ? 250
                                        : currentScreen == screens.HOME
                                            ? 250
                                            : currentScreen == screens.PORTFOLIO
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .2,
                                    height: isDrawerOpen
                                        ? 250
                                        : currentScreen == screens.HOME
                                            ? 250
                                            : currentScreen == screens.PORTFOLIO
                                                ? 250
                                                : 350,
                                    decoration: BoxDecoration(
                                      color: kColorPurple.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(
                                        isDrawerOpen ? 120 : 45,
                                      ),
                                      border: Border.all(
                                        width: 15,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 400),
                                    child: Container(
                                      child: Center(
                                        child: AnimatedDefaultTextStyle(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                          style: GoogleFonts.bebasNeue(
                                            color: Colors.white,
                                            fontSize: fontSize,
                                          ),
                                          child: currentScreen == screens.HOME
                                              ? Text(
                                                  'Welcome',
                                                  style: kStyleDefault.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : currentScreen ==
                                                      screens.PORTFOLIO
                                                  ? PortfolioPage()
                                                  : ContactInfo(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 150,
                            left: 150,
                            child: MouseRegion(
                              cursor: MouseCursor.uncontrolled,
                              onEnter: (event) {
                                setState(() {
                                  copyRightFontSize += 15;
                                });
                              },
                              onExit: (event) {
                                setState(() {
                                  copyRightFontSize -= 15;
                                });
                              },
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: copyRightFontSize,
                                  ),
                                  child: const Text(
                                    'esentis 2021 ©',
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
