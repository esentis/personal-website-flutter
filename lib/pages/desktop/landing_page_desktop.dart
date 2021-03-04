import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/states.dart';
import 'package:esentispws/models/project.dart';
import 'package:esentispws/pages/desktop/contact/contact.dart';
import 'package:esentispws/pages/desktop/portfolio/project_widget.dart';
import 'package:esentispws/pages/desktop/widgets/cloud.dart';
import 'package:esentispws/pages/desktop/widgets/menu.dart';
import 'package:esentispws/services/projects_service.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/constants.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
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
    with TickerProviderStateMixin {
  bool cloudOneReachedEnd = false;
  bool cloudTwoReachedEnd = false;
  bool cloudThreeReachedEnd = false;
  AnimationController _scaffoldBgColorController;
  AnimationController _cloudOnecontroller;
  Animation<double> cloudOneAnimation;

  AnimationController _cloudTwocontroller;
  Animation<double> cloudTwoAnimation;

  AnimationController _cloudThreecontroller;
  Animation<double> cloudThreeAnimation;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();

    _scaffoldBgColorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      value: 0,
    );
    _cloudOnecontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 45),
    );
    cloudOneAnimation =
        Tween<double>(begin: -45, end: 750).animate(_cloudOnecontroller)
          ..addListener(() {
            setState(() {
              if (!cloudOneReachedEnd &&
                  _cloudOnecontroller.status == AnimationStatus.completed) {
                cloudOneReachedEnd = true;
                _cloudOnecontroller.animateBack(0);
              } else if (cloudOneReachedEnd &&
                  _cloudOnecontroller.status == AnimationStatus.dismissed) {
                cloudOneReachedEnd = false;
                _cloudOnecontroller.forward();
              }
            });
          });
    _cloudOnecontroller.forward();

    _cloudTwocontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 65),
    );
    cloudTwoAnimation =
        Tween<double>(begin: -0, end: 1000).animate(_cloudTwocontroller)
          ..addListener(() {
            setState(() {
              if (!cloudTwoReachedEnd &&
                  _cloudTwocontroller.status == AnimationStatus.completed) {
                cloudTwoReachedEnd = true;
                _cloudTwocontroller.animateBack(0);
              } else if (cloudTwoReachedEnd &&
                  _cloudTwocontroller.status == AnimationStatus.dismissed) {
                cloudTwoReachedEnd = false;
                _cloudTwocontroller.forward();
              }
            });
          });
    _cloudTwocontroller.forward();

    _cloudThreecontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 45),
    );
    cloudThreeAnimation =
        Tween<double>(begin: 500, end: 1000).animate(_cloudThreecontroller)
          ..addListener(() {
            setState(() {
              if (!cloudThreeReachedEnd &&
                  _cloudThreecontroller.status == AnimationStatus.completed) {
                cloudThreeReachedEnd = true;
                _cloudThreecontroller.animateBack(0);
              } else if (cloudThreeReachedEnd &&
                  _cloudThreecontroller.status == AnimationStatus.dismissed) {
                cloudThreeReachedEnd = false;
                _cloudThreecontroller.forward();
              }
            });
          });
    _cloudThreecontroller.forward();
  }

  @override
  void dispose() {
    _cloudOnecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localeToggler = context.watch<Language>();
    var themeToggler = context.watch<ThemeStyle>();

    return LayoutBuilder(builder: (context, cs) {
      return Scaffold(
        body: AnimatedBuilder(
            animation: _scaffoldBgColorController,
            builder: (context, child) {
              return Stack(
                children: [
                  // Animated background
                  Positioned.fill(
                    child: Container(
                      width: cs.maxWidth,
                      height: cs.maxHeight,
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
                  Positioned.fill(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 700),
                      opacity: themeToggler.themeStatus == kTheme.dark ? 1 : 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Lottie.asset(
                          'animations/night_sky.json',
                          repeat: true,
                          fit: BoxFit.cover,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: ThemeSelector(
                              scaffoldBgColorController:
                                  _scaffoldBgColorController,
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
                              onContact: () {
                                logger.wtf('tapped contact');
                              },
                              scaffoldBgColorController:
                                  _scaffoldBgColorController,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: PageTitle(
                            scaffoldBgColorController:
                                _scaffoldBgColorController,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AnimatedPositioned(
                    top: themeToggler.themeStatus == kTheme.dark ? -250 : 0,
                    left: cloudOneAnimation.value,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {},
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(
                            125,
                            (125 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CloudShadow(),
                        ),
                        CustomPaint(
                          size: Size(
                            125,
                            (125 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Cloud(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    top: themeToggler.themeStatus == kTheme.dark ? -250 : 0,
                    right: cloudOneAnimation.value,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {},
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(
                            100,
                            (100 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CloudShadow(),
                        ),
                        CustomPaint(
                          size: Size(
                            100,
                            (100 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Cloud(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    top: themeToggler.themeStatus == kTheme.dark ? -250 : 0,
                    left: cloudTwoAnimation.value,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {},
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(
                            225,
                            (225 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CloudShadow(),
                        ),
                        CustomPaint(
                          size: Size(
                            225,
                            (225 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Cloud(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    top: themeToggler.themeStatus == kTheme.dark ? -250 : 25,
                    right: cloudTwoAnimation.value,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {},
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(
                            145,
                            (145 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CloudShadow(),
                        ),
                        CustomPaint(
                          size: Size(
                            145,
                            (145 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Cloud(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedPositioned(
                    top: themeToggler.themeStatus == kTheme.dark ? -250 : 10,
                    right: cloudThreeAnimation.value,
                    duration: const Duration(milliseconds: 400),
                    onEnd: () {},
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(
                            185,
                            (185 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: CloudShadow(),
                        ),
                        CustomPaint(
                          size: Size(
                            185,
                            (185 * 0.5833333333333334).toDouble(),
                          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                          painter: Cloud(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 250,
                      left: 250,
                      bottom: 0,
                      top: 450,
                      child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_jYTS0r.json')),
                  // Positioned(
                  //   top: MediaQuery.of(context).size.height * .5,
                  //   // right: MediaQuery.of(context).size.width * .3,
                  //   // left: MediaQuery.of(context).size.width * .3,
                  //   bottom: 0,
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width,
                  //     child: StreamBuilder<List<Project>>(
                  //       stream: projectsStream(),
                  //       builder: (context, snapshot) {
                  //         if (!snapshot.hasData) {
                  //           return const Center(
                  //             child: CircularProgressIndicator(),
                  //           );
                  //         }

                  //         var projects = snapshot.data;
                  //         return Scrollbar(
                  //           child: ListView.builder(
                  //             itemCount: projects.length,
                  //             itemBuilder: (context, index) => ProjectWidget(
                  //               name: projects[index].name,
                  //               description: projects[index].description,
                  //               colorControllerValue:
                  //                   _scaffoldBgColorController.value,
                  //               sourceCode: projects[index].sourceUrl,
                  //               techStack: projects[index].techStack,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ],
              );
            }),
      );
    });
  }
}
