// To parse this JSON data, do
//
//     final project = projectFromMap(jsonString);

// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  Project({
    this.sourceUrl,
    this.screenshots,
    this.liveUrl,
    this.name,
    this.techStack,
    this.description,
    this.createdAt,
  });

  String? sourceUrl;
  List<String>? screenshots;
  String? liveUrl;
  String? name;
  List<String>? techStack;
  String? description;
  Timestamp? createdAt;

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        // ignore: unnecessary_null_in_if_null_operators
        sourceUrl: json['sourceUrl'] ?? null,
        createdAt: json['createdAt'],
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
      length,
      (index) => Project.fromMap(this[index].data() as Map<String, dynamic>),
    );
  }
}
