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
                  Card(
                  child: ListTile(
                  leading: const FlutterLogo(size: 56,),
                  title: const Text(
                      'Course description:',),
                  subtitle: (description == null)? const Text('No description.') : Text(description),),
                    ),
                  Expanded(child: AvailableList(course: widget.course, buildRow: buildRow)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(Available available) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
                leading: const Icon(Icons.account_box),
                title: Text(available.tutor),
                subtitle: Text(dateFormat.format(available.date)),
                trailing: Checkbox(
                  value: available.done ?? false,
                  onChanged: (bool? newValue) {
                    setState(() {
                      available.done = newValue;
                    });
                  },
                )

                  ),
                ),
              ],
            ),
    );
  }
}
// value: available.done ?? false,
// onChanged: (bool? newValue) {
// setState(() {
// available.done = newValue;