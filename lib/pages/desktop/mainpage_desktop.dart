import 'package:esentispws/components/menu_item.dart';
import 'package:esentispws/components/states.dart';
import 'package:esentispws/pages/desktop/widgets/menu.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esentispws/constants.dart';
import 'package:provider/provider.dart';

import 'skills.dart';

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = PageController(initialPage: 0);
int currentIndex = 0;

class MainPageDesktop extends StatefulWidget {
  @override
  _MainPageDesktopState createState() => _MainPageDesktopState();
}

class _MainPageDesktopState extends State<MainPageDesktop>
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
    var themeToggler = context.watch<ThemeStyle>();
    var localToggler = context.watch<Language>();

    return AnimatedBuilder(
        animation: _scaffoldBgColorController,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: bgColorSwitches.evaluate(
                AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        themeToggler.toggleTheme();
                        themeToggler.themeStatus == kTheme.light
                            ? _scaffoldBgColorController.animateTo(0,
                                curve: Curves.easeInOut)
                            : _scaffoldBgColorController.animateTo(1,
                                curve: Curves.easeInOut);
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        child: FlareActor('dark_light.flr',
                            alignment: Alignment.center,
                            animation: themeToggler.themeStatus == kTheme.light
                                ? 'A2'
                                : 'A1'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            localToggler.toggleLanguage();
                            setState(() {});
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  localToggler.localeStatus == kLocale.english
                                      ? 'english.png'
                                      : 'greekflag.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    children: [
                      Text(
                        localToggler.localeStatus == kLocale.english
                            ? 'George Leonidis'
                            : 'Γιώργος Λεωνίδης',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 50,
                          color: textColorSwitches.evaluate(
                              AlwaysStoppedAnimation(
                                  _scaffoldBgColorController.value)),
                        ),
                      ),
                      Text(
                        localToggler.localeStatus == kLocale.english
                            ? 'Software Developer'
                            : 'Προγραμματιστής Λογισμικού',
                        style: GoogleFonts.openSansCondensed(
                          fontSize: 25,
                          color: textColorSwitches.evaluate(
                              AlwaysStoppedAnimation(
                                  _scaffoldBgColorController.value)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // MAIN MENU
                Menu(
                    localToggler: localToggler,
                    scaffoldBgColorController: _scaffoldBgColorController),
                const SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: PageView(
                    controller: mainPageController,
                    children: [
                      //HOME PAGEVIEW index 0
                      Column(
                        children: [
                          Container(
                            child: Image.asset(
                              'flutter.png',
                              fit: BoxFit.fill,
                            ),
                          ),
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
                        ],
                      ),

                      //PORTFOLIO PAGEVIEW index 1
                      const Center(child: Text('PORTFOLIO')),

                      //SKILLS PAGEVIEW index 2
                      Skills(
                          localeToggler: localToggler,
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
