import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/states.dart';
import 'package:esentispws/models/project.dart';
import 'package:esentispws/pages/desktop/contact/contact.dart';
import 'package:esentispws/pages/desktop/portfolio/project_widget.dart';
import 'package:esentispws/pages/desktop/widgets/menu.dart';
import 'package:esentispws/services/projects_service.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:logger/logger.dart';
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
var logger = Logger();

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

    return Scaffold(
      body: AnimatedBuilder(
          animation: _scaffoldBgColorController,
          builder: (context, child) {
            return Stack(
              children: [
                // Animated background
                Positioned.fill(
                  child: Container(
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
                      ),
                    ),
                  ),
                ),

                Positioned(
                  child: Column(
                    children: <Widget>[
                      // Dark - Light theme toggler AND language toggler
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
                      //
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35.0,
                            vertical: 20,
                          ),
                          child: Menu(
                            localeToggler: localeToggler,
                            scaffoldBgColorController:
                                _scaffoldBgColorController,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: PageTitle(
                          scaffoldBgColorController: _scaffoldBgColorController,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .5,
                  // right: MediaQuery.of(context).size.width * .3,
                  // left: MediaQuery.of(context).size.width * .3,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<List<Project>>(
                      stream: projectsStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        var projects = snapshot.data;
                        return Scrollbar(
                          child: ListView.builder(
                            itemCount: projects.length,
                            itemBuilder: (context, index) => ProjectWidget(
                              name: projects[index].name,
                              description: projects[index].description,
                              colorControllerValue:
                                  _scaffoldBgColorController.value,
                              screenshots: projects[index].screenshots,
                              sourceCode: projects[index].sourceUrl,
                              techStack: projects[index].techStack,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
