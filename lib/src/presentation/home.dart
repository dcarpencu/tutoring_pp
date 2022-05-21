import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/containers/user_container.dart';
import 'package:tutoring_pp/src/models/index.dart';
import 'package:tutoring_pp/src/presentation/home_page.dart';
import 'package:tutoring_pp/src/presentation/home_page_admin.dart';
import 'package:tutoring_pp/src/presentation/login_page.dart';
import 'package:tutoring_pp/src/presentation/role_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        if (user != null) {
          return const HomePage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
