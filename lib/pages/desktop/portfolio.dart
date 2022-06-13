import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:esentispws/components/esentis_icons.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/models/project.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({required this.deviceType});

  final DeviceType deviceType;

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('projects').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // We map the response to a list of projects and we sort them by date.
        final projects = snapshot.data!.docs.mapProjects()
          ..sort(
            (a, b) => b.createdAt!.millisecondsSinceEpoch
                .compareTo(a.createdAt!.millisecondsSinceEpoch),
          );
        return ListView.builder(
          itemCount: projects.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemBuilder: (context, index) {
            final icons = skillIcons(projects[index]);

            return Center(
              child: Padding(
                padding: EdgeInsets.all(
                  widget.deviceType == DeviceType.mobile
                      ? 18
                      : widget.deviceType == DeviceType.tablet
                          ? 25
                          : 30,
                ),
                child: Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: kColorBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.transparent),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.white.withOpacity(0.3),
                        offset: const Offset(-1, -1),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      if (projects[index].libraryUrl != null) ...[
                        const SizedBox(
                          height: 10,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              launchLink(projects[index].libraryUrl!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.white.withOpacity(0.3),
                                    offset: const Offset(-1, -1),
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'LIBRARY',
                                  style: kStyleDefault.copyWith(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.white.withOpacity(0.3),
                              offset: const Offset(-1, -1),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            projects[index].name!,
                            style: kStyleDefault.copyWith(
                              fontSize: 20,
                              color: kColorBackground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Flexible(
                        child: Text(
                          projects[index].description!,
                          style: kStyleDefault,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Flexible(
                        child: Wrap(
                          children: icons
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Release date',
                            style: kStyleDefault,
                          ),
                          Text(
                            formatDate(
                              DateTime.fromMillisecondsSinceEpoch(
                                projects[index]
                                    .createdAt!
                                    .millisecondsSinceEpoch,
                              ),
                              [d, '-', MM, '-', yyyy],
                            ),
                            style: kStyleDefault,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          launchLink(projects[index].sourceUrl!);
                        },
                        child: Text(
                          'Source code',
                          style: kStyleDefault.copyWith(
                            fontSize: 20,
                            color: kColorHomeBackground,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

List<Icon> skillIcons(Project project) {
  const double iconSize = 45;

  // ignore: omit_local_variable_types
  final List<Icon> skillIcons = [];
  // ignore: avoid_function_literals_in_foreach_calls
  project.techStack!.forEach(
    (skillName) {
      if (skillName == 'flutter') {
        skillIcons.add(
          const Icon(
            Esentis.flutter,
            color: Color(0xff27B0EE),
            size: iconSize,
          ),
        );
      } else if (skillName == 'firebase') {
        skillIcons.add(
          const Icon(
            Esentis.firebase,
            color: Color(0xffFFCB2B),
            size: iconSize,
          ),
        );
      } else if (skillName == 'express') {
        skillIcons.add(
          const Icon(
            Esentis.express,
            color: Colors.black,
            size: iconSize,
          ),
        );
      } else if (skillName == 'nodejs') {
        skillIcons.add(
          const Icon(
            Esentis.nodejs,
            color: Color(0xff73B300),
            size: iconSize,
          ),
        );
      } else if (skillName == 'mongodb') {
        skillIcons.add(
          const Icon(
            Esentis.mongodb,
            color: Color(0xff8CCC8A),
            size: iconSize,
          ),
        );
      } else if (skillName == 'javascript') {
        skillIcons.add(
          const Icon(
            Esentis.javascript,
            color: Color(0xffEDD718),
            size: iconSize,
          ),
        );
      } else if (skillName == 'java') {
        skillIcons.add(
          const Icon(
            Esentis.java,
            color: Color(0xff0776BD),
            size: iconSize,
          ),
        );
      } else if (skillName == 'postgres') {
        skillIcons.add(
          const Icon(
            Esentis.postgresql,
            color: Color(0xff2C618B),
            size: iconSize,
          ),
        );
      } else if (skillName == 'android') {
        skillIcons.add(
          const Icon(
            Esentis.android,
            color: Color(0xff73BA58),
            size: iconSize,
          ),
        );
      } else if (skillName == 'apple') {
        skillIcons.add(
          const Icon(
            Esentis.apple,
            color: Color(0xffB0B1B6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'python') {
        skillIcons.add(
          const Icon(
            Esentis.python,
            color: Color(0xff5E7D98),
            size: iconSize,
          ),
        );
      } else if (skillName == 'csharp') {
        skillIcons.add(
          const Icon(
            Esentis.csharp,
            color: Color(0xff642076),
            size: iconSize,
          ),
        );
      } else if (skillName == 'css') {
        skillIcons.add(
          const Icon(
            Esentis.css3,
            color: Color(0xff1C89B6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'react') {
        skillIcons.add(
          const Icon(
            Esentis.react,
            color: Color(0xff58C4E9),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dotnet') {
        skillIcons.add(
          const Icon(
            Esentis.dotnet,
            color: Color(0xff47B6E7),
            size: iconSize,
          ),
        );
      } else if (skillName == 'bootstrap') {
        skillIcons.add(
          const Icon(
            Esentis.bootstrap,
            color: Color(0xff7511F1),
            size: iconSize,
          ),
        );
      } else if (skillName == 'jquery') {
        skillIcons.add(
          const Icon(
            Esentis.jquery,
            color: Color(0xff345975),
            size: iconSize,
          ),
        );
      } else if (skillName == 'html') {
        skillIcons.add(
          const Icon(
            Esentis.html5,
            color: Color(0xffEA6D2C),
            size: iconSize,
          ),
        );
      } else if (skillName == 'studio') {
        skillIcons.add(
          const Icon(
            Esentis.visualstudio,
            color: Color(0xffB482EA),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dart') {
        skillIcons.add(
          const Icon(
            Esentis.dart,
            color: Color(0xff75ACE6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dotnetcore') {
        skillIcons.add(
          const Icon(
            Esentis.dotnetcore,
            color: Color(0xff694097),
            size: iconSize,
          ),
        );
      }
    },
  );
  return skillIcons;
}
