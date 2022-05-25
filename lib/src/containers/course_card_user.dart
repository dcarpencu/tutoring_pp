import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/containers/course_room_user.dart';
import 'package:tutoring_pp/src/models/app_course.dart';

class CourseCardUser extends StatelessWidget {
  CourseCardUser({Key? key, required this.course}) : super(key: key);

  final Course course;
  final Map<String, Color?> splashColor = <String, Color?>{
    'theoretical': Colors.pink[100],
    'hands-on': Colors.blue[100],
    'other': Colors.grey[100],
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.pinkAccent),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            course.name,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              const Icon(
                Icons.linear_scale,
                color: Colors.yellowAccent,
              ),
              Text(
                course.type,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onPressed: () {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CourseRoomUser(course: course),
                ),
              );
            },
          ),
          // onTap: () =>
        ),
      ),
    );
  }
}
