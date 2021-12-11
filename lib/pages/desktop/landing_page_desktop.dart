import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: kColorBackground,
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
              SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 200,
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
                            _pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                      Scaffold(
                        backgroundColor: kColorBackground,
                        body: PortfolioPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
