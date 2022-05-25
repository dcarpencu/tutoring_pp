import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutoring_pp/src/containers/available_list.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/available.dart';

class CourseRoomUser extends StatefulWidget {
  const CourseRoomUser({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<CourseRoomUser> createState() => _CourseRoomUserState();
}

class _CourseRoomUserState extends State<CourseRoomUser> {
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final String? description = widget.course.notes;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AvailableList(course: widget.course, buildRow: buildRow),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Course description:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (description == null)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'No description',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        description,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(Available available) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(available.tutor),
        ),
        Text(dateFormat.format(available.date)),
        Checkbox(
          value: available.done ?? false,
          onChanged: (bool? newValue) {
            setState(() {
              available.done = newValue;
            });
          },
        )
      ],
    );
  }
}
