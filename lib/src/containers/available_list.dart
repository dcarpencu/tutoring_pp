import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/available.dart';

class AvailableList extends StatelessWidget {
  const AvailableList({Key? key, required this.course, required this.buildRow}) : super(key: key);

  final Course course;
  final Widget Function(Available) buildRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Course sessions',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemCount: course.availables.length,
          itemBuilder: (BuildContext context, int index) {
            return buildRow(course.availables[index]);
          },
        ),
      ],
    );
  }
}
