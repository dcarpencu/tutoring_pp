import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutoring_pp/src/containers/user_container.dart';
import 'package:tutoring_pp/src/models/index.dart';

class SettingsUser extends StatefulWidget {
  const SettingsUser({Key? key}) : super(key: key);

  @override
  State<SettingsUser> createState() => _SettingsUserState();
}

class _SettingsUserState extends State<SettingsUser> {
  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: UserContainer(
        builder: (BuildContext context, AppUser? user) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Welcome ${user?.username}! You are finally here!',
                          textStyle: const TextStyle(color: Colors.black)),
                      WavyAnimatedText('You can update your account here!',
                          textStyle: const TextStyle(color: Colors.black)),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      if (kDebugMode) {
                        print('Tap Event');
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('Here you can edit your username:'),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _username,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: 'new username',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new username';
                    } else if (value.length < 3) {
                      return 'Please enter an username longer than 3 characters.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    //_onNext(context);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
