import 'package:esentispws/components/skill.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class ProjectWidget extends StatefulWidget {
  final double colorControllerValue;
  final String name;
  final String description;
  final List<dynamic> screenshots;
  final List<dynamic> techStack;
  final String sourceCode;
  final String liveUrl;
  const ProjectWidget({
    @required this.colorControllerValue,
    @required this.description,
    @required this.name,
    @required this.screenshots,
    @required this.techStack,
    @required this.sourceCode,
    this.liveUrl,
  });
  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        iconColor: textColorSwitches.evaluate(
          AlwaysStoppedAnimation(
            widget.colorControllerValue,
          ),
        ),
        animationDuration: const Duration(
          milliseconds: 400,
        ),
      ),
      child: ExpandableNotifier(
        initialExpanded: false,
        child: ScrollOnExpand(
          child: ExpandablePanel(
            header: Text(
              widget.name,
              style: GoogleFonts.openSansCondensed(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: textColorSwitches.evaluate(
                  AlwaysStoppedAnimation(
                    widget.colorControllerValue,
                  ),
                ),
              ),
            ),
            expanded: Container(
              width: double.infinity,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 12,
                    child: Text(
                      widget.description,
                      style: GoogleFonts.openSansCondensed(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColorSwitches.evaluate(
                          AlwaysStoppedAnimation(
                            widget.colorControllerValue,
                          ),
                        ),
                      ),
                      softWrap: true,
                    ),
                  ),
                  Flexible(
                    flex: 20,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.screenshots
                          .map((imageUrl) => Image.network(imageUrl))
                          .toList(),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Tech used',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                          widget.colorControllerValue,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: widget.techStack
                        .map((techName) => Flexible(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Skill(
                                  image: 'assets/$techName.png',
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  Text(
                    'Live url',
                    style: GoogleFonts.openSansCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColorSwitches.evaluate(
                        AlwaysStoppedAnimation(
                          widget.colorControllerValue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
