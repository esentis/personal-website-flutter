import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:esentispws/components/esentis_icons.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/models/project.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';
import 'package:supercharged/supercharged.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Portfolio',
          style: kStyleDefault.copyWith(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('projects')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // We map the response to a list of projects and we sort them by date.
                  var projects = snapshot.data.docs.mapProjects()
                    ..sort((a, b) => b.createdAt.millisecondsSinceEpoch
                        .compareTo(a.createdAt.millisecondsSinceEpoch));
                  kLog.wtf(projects.first.createdAt);
                  return Container(
                    child: RawScrollbar(
                      timeToFade: 5.seconds,
                      thumbColor: Colors.white,
                      radius: const Radius.circular(20),
                      child: ScrollShadowContainer.custom(
                        boxShadow: BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 5,
                          color: kColorPurple,
                        ),
                        child: ListView.builder(
                          itemCount: projects.length,
                          itemBuilder: (context, index) {
                            var icons = skillIcons(projects[index]);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 9.0,
                                horizontal: 8,
                              ),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                ),
                                onPressed: () {
                                  launchLink(projects[index].sourceUrl);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            projects[index].name,
                                            style: kStyleDefault.copyWith(
                                              fontSize: 30,
                                            ),
                                          ),
                                          Text(
                                            formatDate(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  projects[index]
                                                      .createdAt
                                                      .millisecondsSinceEpoch),
                                              [d, '-', MM, '-', yyyy],
                                            ),
                                            style: kStyleDefault.copyWith(
                                              fontSize: 15,
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: [
                                          ...icons.map(
                                            (e) => Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: e,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

List<Icon> skillIcons(Project project) {
  // ignore: omit_local_variable_types
  List<Icon> skillIcons = [];
  project.techStack.forEach(
    (skillName) {
      if (skillName == 'flutter') {
        skillIcons.add(
          const Icon(
            Esentis.flutter,
            color: Color(0xff27B0EE),
            size: 35,
          ),
        );
      } else if (skillName == 'firebase') {
        skillIcons.add(
          const Icon(
            Esentis.firebase,
            color: Color(0xffFFCB2B),
            size: 35,
          ),
        );
      } else if (skillName == 'express') {
        skillIcons.add(
          const Icon(
            Esentis.express,
            color: Colors.white,
            size: 35,
          ),
        );
      } else if (skillName == 'nodejs') {
        skillIcons.add(
          const Icon(
            Esentis.nodejs,
            color: Color(0xff73B300),
            size: 35,
          ),
        );
      } else if (skillName == 'mongodb') {
        skillIcons.add(
          const Icon(
            Esentis.mongodb,
            color: Color(0xff8CCC8A),
            size: 35,
          ),
        );
      } else if (skillName == 'javascript') {
        skillIcons.add(
          const Icon(
            Esentis.javascript,
            color: Color(0xffEDD718),
            size: 35,
          ),
        );
      } else if (skillName == 'java') {
        skillIcons.add(
          const Icon(
            Esentis.java,
            color: Colors.white,
            size: 35,
          ),
        );
      } else if (skillName == 'postgres') {
        skillIcons.add(
          const Icon(
            Esentis.postgresql,
            color: Color(0xff2C618B),
            size: 35,
          ),
        );
      } else if (skillName == 'android') {
        skillIcons.add(
          const Icon(
            Esentis.android,
            color: Color(0xff73BA58),
            size: 35,
          ),
        );
      } else if (skillName == 'apple') {
        skillIcons.add(
          const Icon(
            Esentis.apple,
            color: Color(0xffB0B1B6),
            size: 35,
          ),
        );
      } else if (skillName == 'python') {
        skillIcons.add(
          const Icon(
            Esentis.python,
            color: Color(0xff5E7D98),
            size: 35,
          ),
        );
      } else if (skillName == 'csharp') {
        skillIcons.add(
          const Icon(
            Esentis.csharp,
            color: Color(0xff642076),
            size: 35,
          ),
        );
      } else if (skillName == 'css') {
        skillIcons.add(
          const Icon(
            Esentis.css3,
            color: Color(0xff1C89B6),
            size: 35,
          ),
        );
      } else if (skillName == 'react') {
        skillIcons.add(
          const Icon(
            Esentis.react,
            color: Color(0xff58C4E9),
            size: 35,
          ),
        );
      } else if (skillName == 'dotnet') {
        skillIcons.add(
          const Icon(
            Esentis.dotnet,
            color: Color(0xff47B6E7),
            size: 35,
          ),
        );
      } else if (skillName == 'bootstrap') {
        skillIcons.add(
          const Icon(
            Esentis.bootstrap,
            color: Color(0xff7511F1),
            size: 35,
          ),
        );
      } else if (skillName == 'jquery') {
        skillIcons.add(
          const Icon(
            Esentis.jquery,
            color: Color(0xff345975),
            size: 35,
          ),
        );
      } else if (skillName == 'html') {
        skillIcons.add(
          const Icon(
            Esentis.html5,
            color: Color(0xffEA6D2C),
            size: 35,
          ),
        );
      } else if (skillName == 'studio') {
        skillIcons.add(
          const Icon(
            Esentis.visualstudio,
            color: Color(0xffB482EA),
            size: 35,
          ),
        );
      } else if (skillName == 'dart') {
        skillIcons.add(
          const Icon(
            Esentis.dart,
            color: Color(0xff75ACE6),
            size: 35,
          ),
        );
      } else if (skillName == 'dotnetcore') {
        skillIcons.add(
          const Icon(
            Esentis.dotnetcore,
            color: Color(0xff694097),
            size: 35,
          ),
        );
      }
    },
  );
  return skillIcons;
}
