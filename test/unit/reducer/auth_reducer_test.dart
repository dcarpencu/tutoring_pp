import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tutoring_pp/src/actions/index1.dart';
import 'package:tutoring_pp/src/models/index.dart';
import 'package:tutoring_pp/src/reducer/auth_reducer.dart';

Future<void> main() async {
  final Map<String, dynamic> stateData =
  jsonDecode(File('./test/unit/reducer/res/state_with_user.json').readAsStringSync()) as Map<String, dynamic>;
  final Map<String, dynamic> userData =
  jsonDecode(File('./test/unit/reducer/res/user.json').readAsStringSync()) as Map<String, dynamic>;

  test('logoutSuccessful',() {

    final AppState initial = AppState.fromJson(stateData);

    final AppState result = authReducer(initial, const Logout.successful());
    expect(result.user, isNull);
  });

  test('userAction', () {
    final AppState initial = AppState.fromJson(userData);

    final AppUser user = AppUser.fromJson(userData);
    final AppState result = authReducer(initial, Login.successful(user));

    expect(result.user, user);
  });
}