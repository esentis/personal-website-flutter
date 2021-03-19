import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/esentis_icons.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';
import 'package:esentispws/models/project.dart';

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
              bottom: 60,
              right: 10.0,
              left: 10,
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
                  var projects = snapshot.data.docs.mapProjects();

                  return Container(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.white.withOpacity(0.5),
                        height: 5,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        var icons = skillIcons(projects[index]);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9.0),
                          child: GestureDetector(
                            onTap: () {
                              launchLink(projects[index].sourceUrl);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    projects[index].name,
                                    style: const TextStyle(
                                      fontSize: 35,
                                    ),
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
            Esentis.dot,
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
      }
    },
  );
  return skillIcons;
}
