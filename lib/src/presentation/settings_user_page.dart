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
  //final TextEditingController _username = TextEditingController();

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
          return Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: DefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: <WavyAnimatedText>[
                        WavyAnimatedText('Welcome ${user?.username}! You are finally here!',
                            textStyle: const TextStyle(color: Colors.black),),
                        WavyAnimatedText('You can update your account here!',
                            textStyle: const TextStyle(color: Colors.black),),
                      ],
                      onTap: () {
                        if (kDebugMode) {
                          print('Tap Event');
                        }
                      },
                    ),
                  ),
                ),
                buildUserInfoDisplay(user!.username, 'Username'),
                buildUserInfoDisplay(user.email, 'email'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Container(
              width: 350,
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
              ),),),
              child: Row(children: <Widget>[
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          getValue,
                          style: const TextStyle(fontSize: 16, height: 1.4),
                        ),),),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40,
                )
              ],),)
        ],
      ),);

  Widget buildAbout(AppUser user) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
              ),),),
              child: Row(children: <Widget>[
                Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.email,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                ),),),),),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40,
                )
              ],),)
        ],
      ),);

}
