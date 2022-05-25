import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/containers/course_room.dart';
import 'package:tutoring_pp/src/models/app_course.dart';

class CourseCard extends StatelessWidget {
  CourseCard({Key? key, required this.course}) : super(key: key);

  final Course course;
  final Map<String, Color?> splashColor = <String, Color?>{
    'theoretical': Colors.pink[100],
    'hands-on': Colors.blue[100],
    'other': Colors.grey[100],
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: splashColor[course.type],
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Text(course.name),
                    Text(course.type),
                    Text(course.type),
                    Text(course.type),
                    Text(course.type),
                    Text(course.type),
                  ],
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.star))
          ],
        ),
        onTap: () => Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CourseRoom(course: course),
          ),
        ),
      ),
    );
  }
}
