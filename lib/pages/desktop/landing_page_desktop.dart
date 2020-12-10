import 'package:esentispws/components/states.dart';
import 'package:esentispws/pages/desktop/widgets/menu.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'skills.dart';
import 'widgets/language_selector.dart';
import 'widgets/page_title.dart';
import 'widgets/theme_selector.dart';
import 'package:google_fonts/google_fonts.dart';

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = PageController(initialPage: 0);
int currentIndex = 0;

class LandingPageDesktop extends StatefulWidget {
  @override
  _LandingPageDesktopState createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop>
    with SingleTickerProviderStateMixin {
  AnimationController _scaffoldBgColorController;

  @override
  void initState() {
    super.initState();
    _scaffoldBgColorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var localeToggler = context.watch<Language>();

    return AnimatedBuilder(
        animation: _scaffoldBgColorController,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    gradientColorTwo.evaluate(
                      AlwaysStoppedAnimation(
                        _scaffoldBgColorController.value,
                      ),
                    ),
                    gradientColorOne.evaluate(
                      AlwaysStoppedAnimation(
                        _scaffoldBgColorController.value,
                      ),
                    )
                  ],
                )),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ThemeSelector(
                              scaffoldBgColorController:
                                  _scaffoldBgColorController,
                            ),
                            const LanguageSelector(),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35.0,
                          vertical: 20,
                        ),
                        child: Menu(
                          localeToggler: localeToggler,
                          scaffoldBgColorController: _scaffoldBgColorController,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: PageTitle(
                        scaffoldBgColorController: _scaffoldBgColorController,
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Lottie.asset(
                              'programmer.json',
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: PageView(
                              controller: mainPageController,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                // TODO: FIX THE DARN FLEXES
                                //HOME PAGEVIEW index 0
                                Column(children: [
                                  ExpandableTheme(
                                    data: ExpandableThemeData(
                                      iconColor: textColorSwitches.evaluate(
                                        AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value,
                                        ),
                                      ),
                                      animationDuration: const Duration(
                                        milliseconds: 400,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        ExpandablePanel(
                                          header: Text(
                                            projects[0].name,
                                            style:
                                                GoogleFonts.openSansCondensed(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: textColorSwitches.evaluate(
                                                AlwaysStoppedAnimation(
                                                  _scaffoldBgColorController
                                                      .value,
                                                ),
                                              ),
                                            ),
                                          ),
                                          expanded: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Flexible(
                                                flex: 12,
                                                child: Text(
                                                  projects[0].description,
                                                  style: GoogleFonts
                                                      .openSansCondensed(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: textColorSwitches
                                                        .evaluate(
                                                      AlwaysStoppedAnimation(
                                                        _scaffoldBgColorController
                                                            .value,
                                                      ),
                                                    ),
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ),
                                              Flexible(
                                                flex: 20,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    projects[0].screenshots[0],
                                                    projects[0].screenshots[1]
                                                  ],
                                                ),
                                              ),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Text(
                                                'Tech used',
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: textColorSwitches
                                                      .evaluate(
                                                    AlwaysStoppedAnimation(
                                                      _scaffoldBgColorController
                                                          .value,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              projects[0].techStack[0],
                                            ],
                                          ),
                                        ),
                                        ExpandablePanel(
                                          header: Text(
                                            projects[0].name,
                                            style:
                                                GoogleFonts.openSansCondensed(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: textColorSwitches.evaluate(
                                                AlwaysStoppedAnimation(
                                                  _scaffoldBgColorController
                                                      .value,
                                                ),
                                              ),
                                            ),
                                          ),
                                          expanded: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Flexible(
                                                flex: 12,
                                                child: Text(
                                                  projects[0].description,
                                                  style: GoogleFonts
                                                      .openSansCondensed(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: textColorSwitches
                                                        .evaluate(
                                                      AlwaysStoppedAnimation(
                                                        _scaffoldBgColorController
                                                            .value,
                                                      ),
                                                    ),
                                                  ),
                                                  softWrap: true,
                                                ),
                                              ),
                                              Flexible(
                                                flex: 20,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    projects[0].screenshots[0],
                                                    projects[0].screenshots[1]
                                                  ],
                                                ),
                                              ),
                                              const Spacer(
                                                flex: 1,
                                              ),
                                              Text(
                                                'Tech used',
                                                style: GoogleFonts
                                                    .openSansCondensed(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: textColorSwitches
                                                      .evaluate(
                                                    AlwaysStoppedAnimation(
                                                      _scaffoldBgColorController
                                                          .value,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              projects[0].techStack[0],
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),

                                //SKILLS PAGEVIEW index 2
                                Skills(
                                    localeToggler: localeToggler,
                                    textColorSwitches: textColorSwitches,
                                    scaffoldBgColorController:
                                        _scaffoldBgColorController),

                                //CONTACT PAGEVIEW index 3
                                Center(child: projects[0].screenshots[0]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // MAIN MENU
                  ],
                ),
              ),
            ],
          );
        });
  }
}
