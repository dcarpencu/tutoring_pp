import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class RolePage extends StatelessWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ButttonWithIcon(
                title: 'Student',
                icon: Icons.account_circle_rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            ButttonWithIcon(
              title: 'Admin',
              icon: Icons.admin_panel_settings_rounded,
              onPressed: () {
                Navigator.pushNamed(context, '/loginTeacher');
              },
            ),
          ],
        ),
      ),
    );
  }
}
