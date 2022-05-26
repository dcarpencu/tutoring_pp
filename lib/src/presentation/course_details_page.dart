import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:tutoring_pp/src/actions/add_available.dart';
import 'package:tutoring_pp/src/containers/available_list.dart';
import 'package:tutoring_pp/src/data/courses_database.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/available.dart';
import 'package:tutoring_pp/src/widgets/choose_chips.dart';
import 'package:tutoring_pp/src/widgets/text_field.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  final CoursesDatabase repository = CoursesDatabase();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  late List<CategoryOption> courseTypes;
  late String name;
  late String type;
  String? notes;

  @override
  void initState() {
    type = widget.course.type;
    name = widget.course.name;
    courseTypes = [
      CategoryOption(type: 'beginner', name: 'Beginner', isSelected: type == 'beginner'),
      CategoryOption(type: 'intermediate', name: 'Intermediate', isSelected: type == 'intermediate'),
      CategoryOption(type: 'expert', name: 'Expert', isSelected: type == 'expert'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: double.infinity,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              UserTextField(
                name: 'Course Name',
                initialValue: widget.course.name,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input name';
                  }
                },
                inputType: TextInputType.name,
                onChanged: (String? value) => name = value ?? name,
              ),
              ChooseType(
                title: 'Course Difficulty',
                options: courseTypes,
                onOptionTap: (CategoryOption value) {
                  setState(() {
                    for (final CategoryOption element in courseTypes) {
                      type = value.type;
                      element.isSelected = element.type == value.type;
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              UserTextField(
                name: 'notes',
                initialValue: widget.course.notes ?? '',
                validator: (String? value) {},
                inputType: TextInputType.text,
                onChanged: (String? value) => notes = value,
              ),
              AvailableList(course: widget.course, buildRow: buildRow),
              FloatingActionButton(
                onPressed: () {
                  addAvailable(widget.course, () {
                    setState(() {});
                  });
                },
                tooltip: 'Add Availability',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.blue.shade600,
                      onPressed: () {
                        Navigator.of(context).pop();
                        repository.deleteCourse(widget.course);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )),
                  MaterialButton(
                    color: Colors.blue.shade600,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).pop();
                        widget.course.name = name;
                        widget.course.type = type;
                        widget.course.notes = notes ?? widget.course.notes;

                        repository.updateCourse(widget.course);
                      }
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  void addAvailable(Course course, Function callback) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return AddAvailable(course: course, callback: callback);
      },
    );
  }
}
