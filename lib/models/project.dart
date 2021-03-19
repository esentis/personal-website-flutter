// To parse this JSON data, do
//
//     final project = projectFromMap(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  Project({
    this.sourceUrl,
    this.screenshots,
    this.liveUrl,
    this.name,
    this.techStack,
    this.description,
  });

  String sourceUrl;
  List<String> screenshots;
  String liveUrl;
  String name;
  List<String> techStack;
  String description;

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        // ignore: unnecessary_null_in_if_null_operators
        sourceUrl: json['sourceUrl'] ?? null,
        screenshots: json['screenshots'] == null
            ? null
            : List<String>.from(json['screenshots'].map((x) => x)),
        // ignore: unnecessary_null_in_if_null_operators
        liveUrl: json['liveUrl'] ?? null,
        // ignore: unnecessary_null_in_if_null_operators
        name: json['name'] ?? null,
        techStack: json['techStack'] == null
            ? null
            : List<String>.from(json['techStack'].map((x) => x)),
        // ignore: unnecessary_null_in_if_null_operators
        description: json['description'] ?? null,
      );
}

extension PortfolioExts on List<QueryDocumentSnapshot> {
  List<Project> mapProjects() {
    return List<Project>.generate(
        length, (index) => Project.fromMap(this[index].data()));
  }
}
