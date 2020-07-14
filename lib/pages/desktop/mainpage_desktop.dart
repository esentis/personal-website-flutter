import 'package:esentispws/components/menu_item.dart';
import 'package:esentispws/components/skill.dart';
import 'package:esentispws/components/states.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esentispws/constants.dart';
import 'package:provider/provider.dart';

kLocale locale = kLocale.english;
kTheme themeStyle = kTheme.light;
PageController mainPageController = new PageController(initialPage: 0);
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
      duration: const Duration(seconds: 1),
      vsync: this,
      value: 0,
    );
  }

  Animatable<Color> bgColorSwiches = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Color(0xFFe0dede),
        end: Color(0xFF092532),
      ),
    ),
  ]);
  Animatable<Color> textColorSwitches = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.black,
        end: Colors.white,
      ),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    final themeToggler = context.watch<ThemeStyle>();
    final localToggler = context.watch<Language>();

    return AnimatedBuilder(
        animation: _scaffoldBgColorController,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: bgColorSwiches.evaluate(
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
                        child: FlareActor("dark_light.flr",
                            alignment: Alignment.center,
                            animation: themeToggler.themeStatus == kTheme.light
                                ? "A2"
                                : "A1"),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              localToggler.toggleLanguage();
                              setState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                    localToggler.localeStatus == kLocale.english
                                        ? "english.png"
                                        : "greekflag.png"),
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Column(
                    children: [
                      Text(
                        localToggler.localeStatus == kLocale.english
                            ? "George Leonidis"
                            : "Γιώργος Λεωνίδης",
                        style: GoogleFonts.gfsNeohellenic(
                          fontSize: 50,
                          color: textColorSwitches.evaluate(
                              AlwaysStoppedAnimation(
                                  _scaffoldBgColorController.value)),
                        ),
                      ),
                      Text(
                        localToggler.localeStatus == kLocale.english
                            ? "Software Developer"
                            : "Προγραμματιστής Λογισμικού",
                        style: GoogleFonts.gfsNeohellenic(
                          fontSize: 25,
                          color: textColorSwitches.evaluate(
                              AlwaysStoppedAnimation(
                                  _scaffoldBgColorController.value)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // MAIN MENU
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //HOME
                    MenuItem(
                      onPress: () {
                        mainPageController.animateToPage(0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutCubic);
                      },
                      text: localToggler.localeStatus == kLocale.english
                          ? kMenuHomeEn
                          : kMenuHomeGr,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                            _scaffoldBgColorController.value),
                      ),
                    ),
                    //PORTFOLIO
                    MenuItem(
                      onPress: () {
                        mainPageController.animateToPage(1,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutCubic);
                      },
                      text: localToggler.localeStatus == kLocale.english
                          ? kMenuPortfolioEn
                          : kMenuPortfolioGr,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                            _scaffoldBgColorController.value),
                      ),
                    ),
                    //SKILLS
                    MenuItem(
                      onPress: () {
                        mainPageController.animateToPage(2,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutCubic);
                      },
                      text: localToggler.localeStatus == kLocale.english
                          ? kMenuSkillsEn
                          : kMenuSkillsGr,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                            _scaffoldBgColorController.value),
                      ),
                    ),
                    //CONTACT
                    MenuItem(
                      onPress: () {
                        mainPageController.animateToPage(3,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutCubic);
                      },
                      text: localToggler.localeStatus == kLocale.english
                          ? kMenuContactEn
                          : kMenuContactGr,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                            _scaffoldBgColorController.value),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Expanded(
                  child: PageView(
                    controller: mainPageController,
                    children: [
                      //HOME PAGEVIEW index 0
                      Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          color: textColorSwitches.evaluate(
                              AlwaysStoppedAnimation(
                                  _scaffoldBgColorController.value)),
                          child: Text("Home"),
                        ),
                      ),

                      //PORTFOLIO PAGEVIEW index 1
                      Center(child: Text("PORTFOLIO")),

                      //SKILLS PAGEVIEW index 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kFlutterTextEn
                                      : kFlutterTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Flutter",
                                  image: 'flutter.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kCssTextEn
                                      : kCssTextGR,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "CSS3",
                                  image: 'css3.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kHtmlTextEn
                                      : kHtmlTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "HTML5",
                                  image: 'html5.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kJavascriptTextEn
                                      : kJavascriptTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "javaScript",
                                  image: 'javascript.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kjQueryTextEn
                                      : kjQueryTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "jQuery",
                                  image: 'jquery.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kReactTextEn
                                      : kReactTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "React",
                                  image: 'react.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                      kLocale.english
                                      ? kPhotoshopTextEn
                                      : kPhotoshopTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Photoshop",
                                  image: 'photoshop.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                      kLocale.english
                                      ? kIllustratorTextEn
                                      : kIllustratorTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Illustrator",
                                  image: 'ai.png',
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: ListView(
                              children: [
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kMongoDbTextEn
                                      : kMongoDbTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Mongodb",
                                  image: 'mongodb.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kNodeJsTextEn
                                      : kNodeJsTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Node.js",
                                  image: 'nodejs.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kExpressJsEn
                                      : kExpressJsGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Express",
                                  image: 'express.png',
                                ),

                                Skill(
                                  text: localToggler.localeStatus ==
                                          kLocale.english
                                      ? kPostgresSqlTextEn
                                      : kPostgresSqlTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "PostgreSQL",
                                  image: 'postgreSQL.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                      kLocale.english
                                      ? kJavaTextEn
                                      : kJavaTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: "Java",
                                  image: 'java.png',
                                ),
                                Skill(
                                  text: localToggler.localeStatus ==
                                      kLocale.english
                                      ? kDotnetTextEn
                                      : kDotnetTextGr,
                                  shadowColor: textColorSwitches.evaluate(
                                      AlwaysStoppedAnimation(
                                          _scaffoldBgColorController.value)),
                                  subtitle: ".NET",
                                  image: 'dotnet.png',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //CONTACT PAGEVIEW index 3
                      Center(child: Text("CONTACT PAGE")),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
