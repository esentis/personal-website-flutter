import 'package:esentispws/components/states.dart';
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
          return Scaffold(
            backgroundColor: bgColorSwitches.evaluate(
                AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
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
                          scaffoldBgColorController: _scaffoldBgColorController,
                        ),
                        const LanguageSelector(),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Menu(
                      localeToggler: localeToggler,
                      scaffoldBgColorController: _scaffoldBgColorController),
                ),
                Flexible(
                  flex: 2,
                  child: PageTitle(
                    scaffoldBgColorController: _scaffoldBgColorController,
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Lottie.asset(
                    'programmer.json',
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                // MAIN MENU

                Flexible(
                  flex: 3,
                  child: PageView(
                    controller: mainPageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //HOME PAGEVIEW index 0
                      Container(
                        width: 300,
                        height: 300,
                        color: textColorSwitches.evaluate(
                          AlwaysStoppedAnimation(
                            _scaffoldBgColorController.value,
                          ),
                        ),
                        child: const Text('Home'),
                      ),

                      //PORTFOLIO PAGEVIEW index 1
                      const Center(child: Text('PORTFOLIO')),

                      //SKILLS PAGEVIEW index 2
                      Skills(
                          localeToggler: localeToggler,
                          textColorSwitches: textColorSwitches,
                          scaffoldBgColorController:
                              _scaffoldBgColorController),

                      //CONTACT PAGEVIEW index 3
                      const Center(child: Text('CONTACT PAGE')),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
