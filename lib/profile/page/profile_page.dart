import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/profile/page/Userdata.dart';
import 'package:hotel_booking/profile/page/edit_profile_page.dart';
import 'package:hotel_booking/profile/utils/user_preferences.dart';
import 'package:hotel_booking/profile/widget/appbar_widget.dart';
import 'package:hotel_booking/profile/widget/button_widget.dart';
import 'package:hotel_booking/profile/widget/numbers_widget.dart';
import 'package:hotel_booking/profile/widget/profile_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

String s = '';
setUsername(String s1) {
  s = s1;
}

getUsername() {
  return s;
}

String e = '';
setUseremail(String e1) {
  e = e1;
}

getUseremail() {
  return e;
}

String i = '';
setUserImage(String i1) {
  i = i1;
}

getUserImage() {
  return i;
}

String a = '';
setUserabout(String a1) {
  a = a1;
}

getUserabout() {
  return a;
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User userService = User();
  var about, email, userImage, name;
  // @override
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
        // appBar: buildAppBar(context),
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        FutureBuilder<List>(
            future: userService.getAllUsers(),
            builder: (context, snapshot) {
              print("print User next line");
              print(userService.getAllUsers());
              print(snapshot.data);
              physics:
              BouncingScrollPhysics();
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      print(snapshot.data![index]['name']);
                      if (snapshot.data![index]['name'] == null)
                        name = 'Writeyour name';
                      else
                        name = snapshot.data![index]['name'];
                      setUsername(name);
                      if (snapshot.data![index]['about'] == null)
                        about = 'Write Something about Yourself';
                      else
                        about = snapshot.data![index]['about'];
                      print(snapshot.data![index]['about']);
                      setUserabout(about);
                      print(snapshot.data![index]['email']);
                      if (snapshot.data![index]['email'] == null)
                        email = 'Enter Your personal Email';
                      else
                        email = snapshot.data![index]['email'];
                      setUseremail(email);
                      print(snapshot.data![index]['userImage']);
                      if (snapshot.data![index]['userImage'] == null)
                        userImage =
                            'https://i.pinimg.com/564x/5a/0e/21/5a0e213cd52002221a2c944ddb667245.jpg';
                      else
                        userImage = "http://192.168.1.244:3000/" +
                            snapshot.data![index]['userImage'];
                      return ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              width: 10,
                              height: 10,
                            ),
                            ProfileWidget(
                              imagePath:
                                  'https://i.pinimg.com/564x/5a/0e/21/5a0e213cd52002221a2c944ddb667245.jpg',
                              //   "http://localhost:3000/uploads/2022-05-02T03-50-40.796Zfood1.png",
                              onClicked: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return EditProfilePage();
                                  },
                                ));
                              },
                            ),
                            const SizedBox(height: 24),
                            buildName(),
                            const SizedBox(height: 24),
                            Center(child: buildUpgradeButton()),
                            const SizedBox(height: 24),
                            //NumbersWidget(),
                            const SizedBox(height: 48),
                            buildAbout(),
                          ]);
                    });
              }
              return CircularProgressIndicator();
            })
      ],
    ));
  }

  Widget buildName() => Column(
        children: [
          Center(
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Your Profile',
      );

  Widget buildAbout() => Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                about,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
      );
}
