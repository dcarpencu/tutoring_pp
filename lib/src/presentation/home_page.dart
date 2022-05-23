import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tutoring_pp/src/actions/index1.dart';
import 'package:tutoring_pp/src/containers/course_card.dart';
import 'package:tutoring_pp/src/containers/course_card_user.dart';
import 'package:tutoring_pp/src/containers/home_page_container.dart';
import 'package:tutoring_pp/src/data/courses_database.dart';
import 'package:tutoring_pp/src/models/app_course.dart';
import 'package:tutoring_pp/src/models/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ScrollController _controller = ScrollController();
  //final DataRepository repository = DataRepository();
  final CoursesDatabase repository = CoursesDatabase();

  Widget _buildList(BuildContext context, List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: snapshot.map((DocumentSnapshot<Map<String, dynamic>> data) => _buildListItem(context, data)).toList(),
    );
  }
// 3
  Widget _buildListItem(BuildContext context, DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Course course = Course.fromSnapshot(snapshot);

    return CourseCardUser(course: course);
  }

  @override
  Widget build(BuildContext context) {
    return HomePageContainer(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: const Text('Available courses'),
            leading: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                StoreProvider.of<AppState>(context).dispatch(const Logout());
              },
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/userSettings');
                  },
                  child: const Icon(
                    Icons.search,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: repository.getStream(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const LinearProgressIndicator();
              }
              return _buildList(context, snapshot.data?.docs ?? []);
            },),
        );
      },
    );
  }
}
