import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/data/courses_database.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/available.dart';

class AddCourseDialog extends StatefulWidget {
  const AddCourseDialog({Key? key}) : super(key: key);

  @override
  _AddCourseDialogState createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  String? courseName;
  String character = '';

  final CoursesDatabase repository = CoursesDatabase();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Course'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Course Name',
              ),
              onChanged: (String text) => courseName = text,
            ),
            RadioListTile(
              title: const Text('Theoretical'),
              value: 'theoretical',
              groupValue: character,
              onChanged: (Object? value) {
                setState(() {
                  character = (value ?? '') as String;
                });
              },
            ),
            RadioListTile(
              title: const Text('Hands-on'),
              value: 'hands-on',
              groupValue: character,
              onChanged: (Object? value) {
                setState(() {
                  character = (value ?? '') as String;
                });
              },
            ),
            RadioListTile(
              title: const Text('Other'),
              value: 'other',
              groupValue: character,
              onChanged: (Object? value) {
                setState(() {
                  character = (value ?? '') as String;
                });
              },
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            if (courseName != null && character.isNotEmpty) {
              final Course newCourse = Course(courseName!, type: character, availables: <Available>[]);
              repository.addPet(newCourse);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
