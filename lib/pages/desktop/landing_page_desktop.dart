import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/animated_backgrounds.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    _zoomDrawerController = ZoomDrawerController();

    _menuAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 700,
      ),
    )..curve(Curves.easeInOut);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This is mainly to get zoomController values and first it has to be assigned and built.
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      slideWidth: 259,
      controller: _zoomDrawerController,
      menuScreen: Scaffold(
        backgroundColor: Colors.black,
        body: DrawerAnimatedBackground(
          menu: Stack(
            children: [
              Positioned(
                left: 40,
                top: MediaQuery.of(context).size.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = screens.PORTFOLIO;
                            _zoomDrawerController.close();
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.fileCode,
                            size: 45,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Portfolio',
                            style: kStyleDefault,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = screens.CONTACT;
                          _zoomDrawerController.close();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.addressBook,
                            size: 45,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Contact',
                            style: kStyleDefault,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width * .3,
                      right: MediaQuery.of(context).size.width * .3,
                      child: ValueListenableBuilder(
                        valueListenable: _zoomDrawerController.stateNotifier,
                        builder: (context, drawerState, child) =>
                            AnimatedOpacity(
                          opacity: drawerState == DrawerState.open ? 1 : 0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
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
                    ),
            ],
          ),
        ),
      ),
      // slideWidth: 12,
      duration: const Duration(milliseconds: 600),
      openCurve: Curves.easeInOut,
      closeCurve: Curves.bounceIn,
      style: DrawerStyle.Style1,

      mainScreen: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PlasmaRenderer(
                type: PlasmaType.infinity,
                particles: 17,
                color: kColorPurple,
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
                  color: kColorBlueDark,
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
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!_zoomDrawerController.isOpen()) {
                                  isDrawerOpen = true;
                                  _zoomDrawerController.open();
                                  _menuAnimationController.forward();
                                } else if (_zoomDrawerController.isOpen()) {
                                  _zoomDrawerController.close();
                                  _menuAnimationController.animateBack(0);
                                }
                              });
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                        ),
                        // The main animated container
                        Align(
                          alignment: Alignment.center,
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
                                width: currentScreen == screens.HOME
                                    ? 250
                                    : currentScreen == screens.PORTFOLIO
                                        ? 550
                                        : 200,
                                height: currentScreen == screens.HOME
                                    ? 250
                                    : currentScreen == screens.PORTFOLIO
                                        ? 550
                                        : 500,
                                decoration: BoxDecoration(
                                  color: currentScreen == screens.HOME
                                      ? Colors.black.withOpacity(0.4)
                                      : Colors.black.withOpacity(0.8),
                                  borderRadius:
                                      currentScreen == screens.PORTFOLIO
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))
                                          : currentScreen == screens.CONTACT
                                              ? BorderRadius.circular(49)
                                              : BorderRadius.circular(
                                                  120,
                                                ),
                                  border: Border.all(
                                    width: currentScreen == screens.PORTFOLIO
                                        ? 0
                                        : 3,
                                    color: currentScreen == screens.PORTFOLIO
                                        ? Colors.transparent
                                        : Colors.white,
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
                                              'Welcome\nto my personal website',
                                              textAlign: TextAlign.center,
                                              style: kStyleDefault.copyWith(
                                                color: Colors.white,
                                                fontSize: 25,
                                              ),
                                            )
                                          : currentScreen == screens.PORTFOLIO
                                              ? PortfolioPage()
                                              : ContactInfo(),
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
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : ValueListenableBuilder(
                                    valueListenable:
                                        _zoomDrawerController.stateNotifier,
                                    builder: (context, drawerState, child) =>
                                        AnimatedOpacity(
                                      opacity: drawerState == DrawerState.open
                                          ? 0
                                          : 1,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                      child: Center(
                                        child: AnimatedDefaultTextStyle(
                                          duration:
                                              const Duration(milliseconds: 400),
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
    );
  }
}
