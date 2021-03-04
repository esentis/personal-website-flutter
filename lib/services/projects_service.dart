import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/models/project.dart';
import 'package:rxdart/rxdart.dart';

Stream<List<Project>> projectsStream() {
  return FirebaseFirestore.instance
      .collection('projects')
      .snapshots()
      .switchMap((qs) => Stream.value(
            List.generate(qs.docs.length,
                (index) => Project.fromMap(qs.docs[index].data())),
          ));
}
