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

class _MainPageDesktopState extends State<MainPageDesktop> {
  @override
  Widget build(BuildContext context) {
    final themeToggler = context.watch<ThemeStyle>();
    final localToggler = context.watch<Language>();

    return Scaffold(
      backgroundColor: themeToggler.themeStatus == kTheme.light
          ? Color(0xFFe0dede)
          : Color(0xFF092532),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  themeToggler.toggleTheme();
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
                  style: GoogleFonts.gfsNeohellenic(fontSize: 50),
                ),
                Text(
                  localToggler.localeStatus == kLocale.english
                      ? "Software Developer"
                      : "Προγραμματιστής Λογισμικού",
                  style: GoogleFonts.gfsNeohellenic(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton(
                onPressed: () {
                  mainPageController.animateToPage(0,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                },
                child: Text(
                  localToggler.localeStatus == kLocale.english
                      ? kMenuHomeEn
                      : kMenuHomeGr,
                  style: GoogleFonts.gfsNeohellenic(fontSize: 30),
                ),
              ),
              FlatButton(
                onPressed: () {
                  mainPageController.animateToPage(1,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                },
                child: Text(
                  localToggler.localeStatus == kLocale.english
                      ? kMenuPortfolioEn
                      : kMenuPortfolioGr,
                  style: GoogleFonts.gfsNeohellenic(fontSize: 30),
                ),
              ),
              FlatButton(
                onPressed: () {
                  mainPageController.animateToPage(2,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                },
                child: Text(
                  localToggler.localeStatus == kLocale.english
                      ? kMenuSkillsEn
                      : kMenuSkillsGr,
                  style: GoogleFonts.gfsNeohellenic(fontSize: 30),
                ),
              ),
              FlatButton(
                onPressed: () {
                  mainPageController.animateToPage(3,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOutCubic);
                },
                child: Text(
                  localToggler.localeStatus == kLocale.english
                      ? kMenuContactEn
                      : kMenuContactGr,
                  style: GoogleFonts.gfsNeohellenic(fontSize: 30),
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
                ///SKILLS PAGEVIEW index 0
                Center(
                  child: Text("Home"),
                ),

                ///SKILLS PAGEVIEW index 1
                Center(child: Text("PORTFOLIO")),

                ///SKILLS PAGEVIEW index 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 85.0),
                            child: Text(
                              "Front End Skills",
                              style: GoogleFonts.gfsNeohellenic(fontSize: 30),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kCssTextEn
                                  : kCssTextGR,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "CSS3",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('css3.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            subtitle: Text(
                              "HTML5",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kHtmlTextEn
                                  : kHtmlTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('html5.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kJavascriptTextEn
                                  : kJavascriptTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "javaScript",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('javascript.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kjQueryTextEn
                                  : kjQueryTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "jQuery",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('jquery.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kReactTextEn
                                  : kReactTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "React",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('react.png'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 85.0),
                            child: Text(
                              "Back End Skills",
                              style: GoogleFonts.gfsNeohellenic(fontSize: 30),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kMongoDbTextEn
                                  : kMongoDbTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "Mongodb",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('mongodb.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            subtitle: Text(
                              "Node.js",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kNodeJsTextEn
                                  : kNodeJsTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('nodejs.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kExpressJsEn
                                  : kExpressJsGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "Express",
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            leading: Image.asset('express.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kPostgresSqlTextEn
                                  : kPostgresSqlTextGr,
                              style: GoogleFonts.gfsNeohellenic(),
                            ),
                            subtitle: Text(
                              "PostgreSQL",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('PostgreSQL.png'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                ///SKILLS PAGEVIEW index 3
                Center(child: Text("CONTACT PAGE")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
