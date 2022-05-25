import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutoring_pp/src/models/app_course.dart';

class CoursesDatabase {
  final CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore.instance.collection('courses');

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference<Map<String, dynamic>>> addPet(Course course) {
    return collection.add(course.toJson());
  }

  void updateCourse(Course course) async {
    await collection.doc(course.referenceId).update(course.toJson());
  }

  void deleteCourse(Course course) async {
    await collection.doc(course.referenceId).delete();
  }
}
