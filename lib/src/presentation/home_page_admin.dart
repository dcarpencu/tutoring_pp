import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tutoring_pp/src/actions/index1.dart';
import 'package:tutoring_pp/src/actions/add_course_dialog.dart';
import 'package:tutoring_pp/src/containers/course_card.dart';
import 'package:tutoring_pp/src/containers/home_page_container.dart';
import 'package:tutoring_pp/src/data/courses_database.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/index.dart';
//import 'package:tutoring_app/course_card.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  //final ScrollController _controller = ScrollController();
  final CoursesDatabase repository = CoursesDatabase();

  // 1
  Widget _buildList(BuildContext context, List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: snapshot.map((DocumentSnapshot<Map<String, dynamic>> data) => _buildListItem(context, data)).toList(),
    );
  }

// 3
  Widget _buildListItem(BuildContext context, DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Course course = Course.fromSnapshot(snapshot);

    return CourseCard(course: course);
  }

  void _addCourse() {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return const AddCourseDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomePageContainer(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: const Text('Admin courses'),
            leading: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(const Logout());
              },
            ),
          ),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: repository.getStream(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              return _buildList(context, snapshot.data?.docs ?? []);
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addCourse,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
