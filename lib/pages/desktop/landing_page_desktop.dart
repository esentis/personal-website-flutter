import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_extensions/string_extensions.dart';

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
  const LandingPageDesktop({required this.deviceType});

  final DeviceType deviceType;

  @override
  _LandingPageDesktopState createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop>
    with TickerProviderStateMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  screens currentScreen = screens.HOME;

  PageController? _pageController;

  double currentPage = 0;

  Animation<double>? size;

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
    return Scaffold(
      backgroundColor: kColorBackground,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 40.0,
          left: 40.0,
        ),
        child: currentScreen == screens.PORTFOLIO
            ? FloatingActionButton(
                backgroundColor: kColorHomeBackground,
                onPressed: () {
                  _pageController!.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: const Icon(Icons.arrow_upward_outlined),
              )
            : const SizedBox(),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _pageController!.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: kColorBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Image.network(
                    'https://i.imgur.com/Ev1tYGT.png',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 266,
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
                }
              },
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Scaffold(
                  backgroundColor: kColorBackground,
                  body: ContactInfo(
                    onCheckWork: () {
                      _pageController!.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Scaffold(
                    backgroundColor: kColorBackground,
                    body: PortfolioPage(
                      deviceType: widget.deviceType,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: kColorBackground,
            child: Center(
              child: Text(
                'esentis ©',
                style: kStyleDefault.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("HH:mm:ss");
    final String dateString = date.format(DateTime.now());
    return Column(
      key: ValueKey(DateTime.now().toString()),
      children: [
        Text(
          '${DateTime.now().day} ${DateTime.now().toString().getMonthFromDate()} ${DateTime.now().year} ',
          textAlign: TextAlign.center,
          style: kStyleDefault.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dateString,
          textAlign: TextAlign.center,
          style: kStyleDefault.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
