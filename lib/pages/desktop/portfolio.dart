import 'dart:ui';

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
                  height: 400,
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
                        height: 10,
                      ),
                      Flexible(
                        child: Text(
                          projects[index].description!,
                          style: kStyleDefault,
                          textAlign: TextAlign.center,
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
        // return RawScrollbar(
        //   isAlwaysShown: true,
        //   controller: _scrollController,
        //   thumbColor: Colors.white,
        //   radius: const Radius.circular(20),
        //   thickness: 10,
        //   child: GridView.builder(
        //     controller: _scrollController,
        //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: widget.deviceType == DeviceType.mobile ||
        //               widget.deviceType == DeviceType.tablet
        //           ? MediaQuery.of(context).size.width
        //           : MediaQuery.of(context).size.width / 2,
        //       mainAxisExtent: 400,
        //       crossAxisSpacing: 5,
        //       mainAxisSpacing: 5,
        //     ),
        //     itemCount: projects.length,
        //     padding: EdgeInsets.zero,
        //     itemBuilder: (context, index) {
        //       final icons = skillIcons(projects[index]);
        //       return Padding(
        //         padding: const EdgeInsets.all(14.0),
        //         child: Card(
        //           child: Padding(
        //             padding: const EdgeInsets.all(20.0),
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 kSelectableText(
        //                   text: projects[index].name!,
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.bold,
        //                   color: kColorBackground,
        //                 ),
        //                 const SizedBox(
        //                   height: 20,
        //                 ),
        //                 kSelectableText(
        //                   text: projects[index].description!,
        //                   fontSize: 20,
        //                   color: kColorBackground,
        //                 ),
        //                 const SizedBox(
        //                   height: 20,
        //                 ),
        //                 TextButton(
        //                   style: ButtonStyle(
        //                     padding: MaterialStateProperty.resolveWith(
        //                       (states) => const EdgeInsets.all(20),
        //                     ),
        //                     backgroundColor: MaterialStateProperty.resolveWith(
        //                       (states) => kColorBackground,
        //                     ),
        //                   ),
        //                   onPressed: () {
        //                     launchLink(projects[index].sourceUrl!);
        //                   },
        //                   child: kText(
        //                     text: 'Source Code',
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 20,
        //                   ),
        //                 ),
        //                 const SizedBox(
        //                   height: 20,
        //                 ),
        //                 Flexible(
        //                   child: Padding(
        //                     padding: const EdgeInsets.fromLTRB(0, 14, 8, 8),
        //                     child: Wrap(
        //                       children: icons,
        //                     ),
        //                   ),
        //                 ),
        //                 Flexible(
        //                   child: Padding(
        //                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
        //                     child: kText(
        // text: formatDate(
        //   DateTime.fromMillisecondsSinceEpoch(
        //     projects[index]
        //         .createdAt!
        //         .millisecondsSinceEpoch,
        //   ),
        //   [d, '-', MM, '-', yyyy],
        // ),
        //                       fontSize: 15,
        //                       color: kColorBackground,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}

List<Icon> skillIcons(Project project) {
  final double iconSize = 45;

  final EdgeInsets padding = EdgeInsets.all(20);
  // ignore: omit_local_variable_types
  final List<Icon> skillIcons = [];
  // ignore: avoid_function_literals_in_foreach_calls
  project.techStack!.forEach(
    (skillName) {
      if (skillName == 'flutter') {
        skillIcons.add(
          Icon(
            Esentis.flutter,
            color: Color(0xff27B0EE),
            size: iconSize,
          ),
        );
      } else if (skillName == 'firebase') {
        skillIcons.add(
          Icon(
            Esentis.firebase,
            color: Color(0xffFFCB2B),
            size: iconSize,
          ),
        );
      } else if (skillName == 'express') {
        skillIcons.add(
          Icon(
            Esentis.express,
            color: Colors.black,
            size: iconSize,
          ),
        );
      } else if (skillName == 'nodejs') {
        skillIcons.add(
          Icon(
            Esentis.nodejs,
            color: Color(0xff73B300),
            size: iconSize,
          ),
        );
      } else if (skillName == 'mongodb') {
        skillIcons.add(
          Icon(
            Esentis.mongodb,
            color: Color(0xff8CCC8A),
            size: iconSize,
          ),
        );
      } else if (skillName == 'javascript') {
        skillIcons.add(
          Icon(
            Esentis.javascript,
            color: Color(0xffEDD718),
            size: iconSize,
          ),
        );
      } else if (skillName == 'java') {
        skillIcons.add(
          Icon(
            Esentis.java,
            color: Color(0xff0776BD),
            size: iconSize,
          ),
        );
      } else if (skillName == 'postgres') {
        skillIcons.add(
          Icon(
            Esentis.postgresql,
            color: Color(0xff2C618B),
            size: iconSize,
          ),
        );
      } else if (skillName == 'android') {
        skillIcons.add(
          Icon(
            Esentis.android,
            color: Color(0xff73BA58),
            size: iconSize,
          ),
        );
      } else if (skillName == 'apple') {
        skillIcons.add(
          Icon(
            Esentis.apple,
            color: Color(0xffB0B1B6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'python') {
        skillIcons.add(
          Icon(
            Esentis.python,
            color: Color(0xff5E7D98),
            size: iconSize,
          ),
        );
      } else if (skillName == 'csharp') {
        skillIcons.add(
          Icon(
            Esentis.csharp,
            color: Color(0xff642076),
            size: iconSize,
          ),
        );
      } else if (skillName == 'css') {
        skillIcons.add(
          Icon(
            Esentis.css3,
            color: Color(0xff1C89B6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'react') {
        skillIcons.add(
          Icon(
            Esentis.react,
            color: Color(0xff58C4E9),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dotnet') {
        skillIcons.add(
          Icon(
            Esentis.dotnet,
            color: Color(0xff47B6E7),
            size: iconSize,
          ),
        );
      } else if (skillName == 'bootstrap') {
        skillIcons.add(
          Icon(
            Esentis.bootstrap,
            color: Color(0xff7511F1),
            size: iconSize,
          ),
        );
      } else if (skillName == 'jquery') {
        skillIcons.add(
          Icon(
            Esentis.jquery,
            color: Color(0xff345975),
            size: iconSize,
          ),
        );
      } else if (skillName == 'html') {
        skillIcons.add(
          Icon(
            Esentis.html5,
            color: Color(0xffEA6D2C),
            size: iconSize,
          ),
        );
      } else if (skillName == 'studio') {
        skillIcons.add(
          Icon(
            Esentis.visualstudio,
            color: Color(0xffB482EA),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dart') {
        skillIcons.add(
          Icon(
            Esentis.dart,
            color: Color(0xff75ACE6),
            size: iconSize,
          ),
        );
      } else if (skillName == 'dotnetcore') {
        skillIcons.add(
          Icon(
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
