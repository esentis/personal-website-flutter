import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/states.dart';
import 'package:esentispws/pages/desktop/contact/contact.dart';
import 'package:esentispws/pages/desktop/portfolio/project_widget.dart';
import 'package:esentispws/pages/desktop/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'skills.dart';
import 'widgets/language_selector.dart';
import 'widgets/page_title.dart';
import 'widgets/theme_selector.dart';

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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
                                //HOME PAGEVIEW index 0
                                Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (context, index) =>
                                          ProjectWidget(
                                            colorControllerValue:
                                                _scaffoldBgColorController
                                                    .value,
                                            name: projects.first.name,
                                            description:
                                                projects.first.description,
                                            techStack: projects.first.techStack,
                                            screenshots:
                                                projects.first.screenshots,
                                            sourceCode:
                                                projects.first.sourceUrl,
                                            liveUrl: projects.first.liveUrl,
                                          )),
                                ),

                                //SKILLS PAGEVIEW index 2
                                Skills(
                                    localeToggler: localeToggler,
                                    textColorSwitches: textColorSwitches,
                                    scaffoldBgColorController:
                                        _scaffoldBgColorController),

                                //CONTACT PAGEVIEW index 3
                                Center(
                                  child: ContactInfo(),
                                ),
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
