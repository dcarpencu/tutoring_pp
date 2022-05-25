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
        const SizedBox(height: 6),
        const Text(
          'Course sessions',
          style: TextStyle(fontSize: 16),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: course.availables.length,
            itemBuilder: (BuildContext context, int index) {
              return buildRow(course.availables[index]);
            },
          ),
        ),
      ],
    );
  }
}
