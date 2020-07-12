import 'package:esentispws/components/states.dart';
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
          ? Color(0xFFdfd3c3)
          : Color(0xFF596e79),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        themeToggler.toggleTheme();
                        setState(() {});
                      },
                      child: Icon(
                        Icons.wb_sunny,
                        size: 50,
                        color: themeToggler.themeStatus == kTheme.light
                            ? Colors.black
                            : Colors.yellow,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                ],
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
                  style: GoogleFonts.muli(fontSize: 50),
                ),
                Text(
                  localToggler.localeStatus == kLocale.english
                      ? "Software Developer"
                      : "Προγραμματιστής Λογισμικού",
                  style: GoogleFonts.muli(fontSize: 25),
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
                  style: GoogleFonts.muli(fontSize: 30),
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
                  style: GoogleFonts.muli(fontSize: 30),
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
                  style: GoogleFonts.muli(fontSize: 30),
                ),
              ),
              FlatButton(
                onPressed: () {mainPageController.animateToPage(3,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutCubic);},
                child: Text(
                  localToggler.localeStatus == kLocale.english
                      ? kMenuContactEn
                      : kMenuContactGr,
                  style: GoogleFonts.muli(fontSize: 30),
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
                Center(child: Text("HOME PAGE")),

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
                              style: GoogleFonts.b612(fontSize: 30),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kCssTextEn
                                  : kCssTextGR,
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "CSS3",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('css3.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            subtitle: Text(
                              "HTML5",
                              style: GoogleFonts.b612(),
                            ),
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kHtmlTextEn
                                  : kHtmlTextGr,
                              style: GoogleFonts.b612(),
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
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "javaScript",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('javascript.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kjQueryTextEn
                                  : kjQueryTextGr,
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "jQuery",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('jquery.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kReactTextEn
                                  : kReactTextGr,
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "React",
                              style: GoogleFonts.b612(),
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
                              style: GoogleFonts.b612(fontSize: 30),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kMongoDbTextEn
                                  : kMongoDbTextGr,
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "Mongodb",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('mongodb.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListTile(
                            subtitle: Text(
                              "Node.js",
                              style: GoogleFonts.b612(),
                            ),
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kNodeJsTextEn
                                  : kNodeJsTextGr,
                              style: GoogleFonts.b612(),
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
                              style: GoogleFonts.b612(),
                            ),
                            subtitle: Text(
                              "Express",
                              style: GoogleFonts.b612(),
                            ),
                            leading: Image.asset('express.png'),
                          ),
                          ListTile(
                            title: Text(
                              localToggler.localeStatus == kLocale.english
                                  ? kPostgresSqlTextEn
                                  : kPostgresSqlTextGr,
                              style: GoogleFonts.b612(),
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
