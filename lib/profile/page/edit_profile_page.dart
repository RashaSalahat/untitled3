import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:hotel_booking/profile/utils/user_preferences.dart';
import 'package:hotel_booking/profile/widget/appbar_widget.dart';
import 'package:hotel_booking/profile/widget/button_widget.dart';
import 'package:hotel_booking/profile/widget/profile_widget.dart';
import 'package:hotel_booking/profile/widget/textfield_widget.dart';
import 'package:hotel_booking/bottomApp.dart';
import '../../buttomappprofile.dart';
import 'Userupdate.dart';
import 'profile_page.dart';

import '../../services/authservice.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final myController = TextEditingController();
  final emailController = TextEditingController();
  final aboutController = TextEditingController();

  var name = getUsername();
  var about = getUserabout();
  var email = getUseremail();
  var userImage = getUserImage();
  var token;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 24),
            ProfileWidget(
              imagePath:
                  'https://i.pinimg.com/564x/5a/0e/21/5a0e213cd52002221a2c944ddb667245.jpg',
              //isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black54,
                      decorationStyle: TextDecorationStyle.wavy,
                      fontFamily: "alex")),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.email), hintText: email, labelText: 'Email'),
              onChanged: (val) {
                email = val;
              },
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: aboutController,
              decoration: InputDecoration(
                  icon: Icon(Icons.format_align_center),
                  hintText: about,
                  labelText: 'About'),
              maxLines: 7,
              onChanged: (val) {
                about = val;
              },
            ),
            const SizedBox(height: 34),
            Container(
              width: 100,
              // height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                    AuthService().updatewithoutimage(about, email).then((val) {
                      Fluttertoast.showToast(
                          msg: "Updated Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BottomParProfile(),
                        ));
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "     Save",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      );
}
