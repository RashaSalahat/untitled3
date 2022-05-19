import 'package:hotel_booking/Doctor/loginDr/loginDr_screen.dart';
import 'package:hotel_booking/chatt/main1.dart';
import 'package:hotel_booking/chatt/page1chat.dart';
import 'package:hotel_booking/chatt/screens/screens.dart';
import 'package:hotel_booking/chatt/screens/splash_screen.dart';
import 'package:hotel_booking/chatt/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/chatt/app.dart';
import 'package:hotel_booking/doctor/chatting_page.dart';
import 'package:hotel_booking/page1/page1info/welcomeinfo.dart';
import 'package:hotel_booking/profile/page/profile_page.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

String ss = user;
String dd = doctor;
String ra = " ";

class ProfileScreen extends StatelessWidget {
  static Route get route => MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: Center(
          child: IconBackground(
            icon: Icons.arrow_back_ios_new,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'hero-profile-picture',
              child: Avatar.large(url: user?.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user?.name ?? 'No name'),
            ),
            const Divider(),
            const _SignOutButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enough Chatting?',
                    style: Theme.of(context).textTheme.subtitle2),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    print(ss);
                    print("Doc");
                    print(dd);
                    if (ss == "user") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                welcomescreeninfo(),
                          ));
                    } else {
//LoginScreen()
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginDrScreen(),
                          ));
                    }
                  },
                  child: const Text('Return to BabyTime'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SignOutButton extends StatefulWidget {
  const _SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  __SignOutButtonState createState() => __SignOutButtonState();
}

class __SignOutButtonState extends State<_SignOutButton> {
  bool _loading = false;

  Future<void> _signOut() async {
    setState(() {
      _loading = true;
    });

    try {
      await StreamChatCore.of(context).client.disconnectUser();
      await firebase.FirebaseAuth.instance.signOut();

      Navigator.of(context).pushReplacement(SplashScreen.route);
    } on Exception catch (e, st) {
      logger.e('Could not sign out', e, st);
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: _signOut,
            child: const Text('Sign out'),
          );
  }
}
