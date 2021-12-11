import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:esentispws/components/esentis_icons.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/models/project.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
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
        final projects = snapshot.data.docs.mapProjects()
          ..sort(
            (a, b) => b.createdAt.millisecondsSinceEpoch
                .compareTo(a.createdAt.millisecondsSinceEpoch),
          );
        return RawScrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          thumbColor: kColorHomeBackground,
          radius: const Radius.circular(20),
          thickness: 10,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: projects.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final icons = skillIcons(projects[index]);
              return Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffeeeef6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kTitle(
                          text: projects[index].name,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: kColorBackground,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        kText(
                          text: projects[index].description,
                          fontSize: 20,
                          color: kColorBackground,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith(
                              (states) => EdgeInsets.zero,
                            ),
                          ),
                          onPressed: () {
                            launchLink(projects[index].sourceUrl);
                          },
                          child: kText(
                            text: 'Source Code',
                            color: kColorBackground,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: kText(
                            text: formatDate(
                              DateTime.fromMillisecondsSinceEpoch(
                                projects[index]
                                    .createdAt
                                    .millisecondsSinceEpoch,
                              ),
                              [d, '-', MM, '-', yyyy],
                            ),
                            fontSize: 15,
                            color: kColorBackground,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Wrap(
                            children: icons,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

List<Icon> skillIcons(Project project) {
  // ignore: omit_local_variable_types
  final List<Icon> skillIcons = [];
  // ignore: avoid_function_literals_in_foreach_calls
  project.techStack.forEach(
    (skillName) {
      if (skillName == 'flutter') {
        skillIcons.add(
          const Icon(
            Esentis.flutter,
            color: Color(0xff27B0EE),
            size: 30,
          ),
        );
      } else if (skillName == 'firebase') {
        skillIcons.add(
          const Icon(
            Esentis.firebase,
            color: Color(0xffFFCB2B),
            size: 30,
          ),
        );
      } else if (skillName == 'express') {
        skillIcons.add(
          const Icon(
            Esentis.express,
            color: Colors.black,
            size: 30,
          ),
        );
      } else if (skillName == 'nodejs') {
        skillIcons.add(
          const Icon(
            Esentis.nodejs,
            color: Color(0xff73B300),
            size: 30,
          ),
        );
      } else if (skillName == 'mongodb') {
        skillIcons.add(
          const Icon(
            Esentis.mongodb,
            color: Color(0xff8CCC8A),
            size: 30,
          ),
        );
      } else if (skillName == 'javascript') {
        skillIcons.add(
          const Icon(
            Esentis.javascript,
            color: Color(0xffEDD718),
            size: 30,
          ),
        );
      } else if (skillName == 'java') {
        skillIcons.add(
          const Icon(
            Esentis.java,
            color: Color(0xff0776BD),
            size: 30,
          ),
        );
      } else if (skillName == 'postgres') {
        skillIcons.add(
          const Icon(
            Esentis.postgresql,
            color: Color(0xff2C618B),
            size: 30,
          ),
        );
      } else if (skillName == 'android') {
        skillIcons.add(
          const Icon(
            Esentis.android,
            color: Color(0xff73BA58),
            size: 30,
          ),
        );
      } else if (skillName == 'apple') {
        skillIcons.add(
          const Icon(
            Esentis.apple,
            color: Color(0xffB0B1B6),
            size: 30,
          ),
        );
      } else if (skillName == 'python') {
        skillIcons.add(
          const Icon(
            Esentis.python,
            color: Color(0xff5E7D98),
            size: 30,
          ),
        );
      } else if (skillName == 'csharp') {
        skillIcons.add(
          const Icon(
            Esentis.csharp,
            color: Color(0xff642076),
            size: 30,
          ),
        );
      } else if (skillName == 'css') {
        skillIcons.add(
          const Icon(
            Esentis.css3,
            color: Color(0xff1C89B6),
            size: 30,
          ),
        );
      } else if (skillName == 'react') {
        skillIcons.add(
          const Icon(
            Esentis.react,
            color: Color(0xff58C4E9),
            size: 30,
          ),
        );
      } else if (skillName == 'dotnet') {
        skillIcons.add(
          const Icon(
            Esentis.dotnet,
            color: Color(0xff47B6E7),
            size: 30,
          ),
        );
      } else if (skillName == 'bootstrap') {
        skillIcons.add(
          const Icon(
            Esentis.bootstrap,
            color: Color(0xff7511F1),
            size: 30,
          ),
        );
      } else if (skillName == 'jquery') {
        skillIcons.add(
          const Icon(
            Esentis.jquery,
            color: Color(0xff345975),
            size: 30,
          ),
        );
      } else if (skillName == 'html') {
        skillIcons.add(
          const Icon(
            Esentis.html5,
            color: Color(0xffEA6D2C),
            size: 30,
          ),
        );
      } else if (skillName == 'studio') {
        skillIcons.add(
          const Icon(
            Esentis.visualstudio,
            color: Color(0xffB482EA),
            size: 30,
          ),
        );
      } else if (skillName == 'dart') {
        skillIcons.add(
          const Icon(
            Esentis.dart,
            color: Color(0xff75ACE6),
            size: 30,
          ),
        );
      } else if (skillName == 'dotnetcore') {
        skillIcons.add(
          const Icon(
            Esentis.dotnetcore,
            color: Color(0xff694097),
            size: 30,
          ),
        );
      }
    },
  );
  return skillIcons;
}
