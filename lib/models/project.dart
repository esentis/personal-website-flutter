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
    this.libraryUrl,
  });

  String? sourceUrl;
  List<String>? screenshots;
  String? liveUrl;
  String? libraryUrl;
  String? name;
  List<String>? techStack;
  String? description;
  Timestamp? createdAt;

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        // ignore: unnecessary_null_in_if_null_operators
        sourceUrl: json['sourceUrl'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
        screenshots: json['screenshots'] == null
            ? null
            : List<String>.from(
                (json['screenshots'] as List<dynamic>).map((x) => x as String),
              ),
        // ignore: unnecessary_null_in_if_null_operators
        liveUrl: json['liveUrl'] as String?,
        // ignore: unnecessary_null_in_if_null_operators
        name: json['name'] as String?,
        techStack: json['techStack'] == null
            ? null
            : List<String>.from(
                (json['techStack'] as List<dynamic>).map((x) => x as String),
              ),
        // ignore: unnecessary_null_in_if_null_operators
        description: json['description'] as String?,
        libraryUrl: json['libraryUrl'] as String?,
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
