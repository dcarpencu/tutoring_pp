import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutoring_pp/src/models/available.dart';

class Course {
  Course(
      this.name,
      {
        this.notes,
        required this.type,
        this.referenceId,
        required this.availables,
      });
  factory Course.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Course newCourse = Course.fromJson(snapshot.data()!);
    // ignore: cascade_invocations
    newCourse.referenceId = snapshot.reference.id;
    return newCourse;
  }
  factory Course.fromJson(Map<String, dynamic> json) => _courseFromJson(json);
  String name;
  String? notes;
  String type;
  List<Available> availables;
  String? referenceId;
  Map<String, dynamic> toJson() => _courseToJson(this);

  @override
  String toString() => 'Course<$name>';
}

Course _courseFromJson(Map<String, dynamic> json) {
  return Course(json['name'] as String,
      notes: json['notes'] as String?,
      type: json['type'] as String,
      availables:
      _convertAvailables(json['availables'] as List<dynamic>),);
}

List<Available> _convertAvailables(List<dynamic> availableMap) {
  final List<Available> availables = <Available>[];

  for (final dynamic available in availableMap) {
    availables.add(Available.fromJson(available as Map<String, dynamic>));
  }
  return availables;
}
// 3
Map<String, dynamic> _courseToJson(Course instance) => <String, dynamic>{
  'name': instance.name,
  'notes': instance.notes,
  'type': instance.type,
  'availables': _availableList(instance.availables),
};
// 4
List<Map<String, dynamic>>? _availableList(List<Available>? availables) {
  if (availables == null) {
    return null;
  }
  final List<Map<String, dynamic>> availableMap = <Map<String, dynamic>>[];
  for (final Available available in availables) {
    availableMap.add(available.toJson());
  }
  return availableMap;
}







/*
class AppCourse {
  AppCourse({
    required this.name,
    this.description,
    required this.tutors,
    this.referenceId,
  })

  String name;
  String? description;
  // 2
  List<String> tutors;
  // 3
  String? referenceId;
  // 4

  // 5
  factory AppCourse.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final AppCourse newAppCourse = AppCourse.fromJson(snapshot.data() as Map<String, dynamic>);
    newAppCourse.referenceId = snapshot.reference.id;
    return newAppCourse;
  }
  // 6
  factory AppCourse.fromJson(Map<String, dynamic> json) => _AppCourseFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _AppCourseToJson(this);

  @override
  String toString() => 'AppCourse<$name>';
}

// 1
AppCourse _AppCourseFromJson(Map<String, dynamic> json) {
  return AppCourse(
      name: json['name'] as String,
      description: json['description'] as String?,
      tutors: json['tutors'] as List<String>,
  );
}
// 2
// 3
Map<String, dynamic> _AppCourseToJson(AppCourse instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'tutors': instance.tutors,
};
// 4

List<Map<String, dynamic>>? _tutorsList(List<Vaccination>? vaccinations) {
  if (vaccinations == null) {
    return null;
  }
  final vaccinationMap = <Map<String, dynamic>>[];
  vaccinations.forEach((vaccination) {
    vaccinationMap.add(vaccination.toJson());
  });
  return vaccinationMap;
}
*/
