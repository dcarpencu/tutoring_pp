import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/containers/course_room.dart';
import 'package:tutoring_pp/src/models/app_course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(course.name),
        subtitle: Text(course.type),
        trailing: IconButton(onPressed: () => Navigator.push<Widget>(
            context, MaterialPageRoute(
              builder: (BuildContext context) => CourseRoom(course: course),
            ),),
            icon: const Icon(Icons.settings_applications_rounded)),
      ),
    );
  }
}
