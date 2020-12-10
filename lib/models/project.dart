import 'package:esentispws/components/skill.dart';
import 'package:flutter/material.dart';

class Project {
  final String name;
  final String description;
  final List<Image> screenshots;
  final String liveUrl;
  final String sourceUrl;
  final List<Skill> techStack;
  const Project({
    @required this.description,
    @required this.liveUrl,
    @required this.name,
    @required this.screenshots,
    @required this.sourceUrl,
    @required this.techStack,
  });
}
