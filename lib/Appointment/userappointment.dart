import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/Appointment/Accepted.dart';
import 'package:hotel_booking/Appointment/AppService.dart';
import 'package:hotel_booking/Appointment/doctors.dart';
import 'package:hotel_booking/Appointment/utisl.dart';
import 'package:hotel_booking/Appointment/moods.dart';
import 'package:hotel_booking/MainPageGrad/mass.dart';
import 'package:hotel_booking/register/register_form.dart';

import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../services/authservice.dart';

import '../bottomApp.dart';

class UserAppointment extends StatelessWidget {
  var username = getUsername();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Appointment(title: 'Flutter Demo Home Page'),
    );
  }
}

class Appointment extends StatefulWidget {
  Appointment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  Doctor docotorService = Doctor();
  Appuser userService = Appuser();
  var Doctorname;
  var date;
  int _selectedIndex = 0;

  var count = 4;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(color: Colors.black),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: purpleGradient),
        ),
        // Overide the default Back button
        automaticallyImplyLeading: true,
        leadingWidth: 100,
        //backgroundColor: Colors.white,
        leading: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return BottomParPage();
              },
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          label: const Text(''),
          style: ElevatedButton.styleFrom(
              elevation: 0, primary: Colors.transparent),
        ),
      ),
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
                _moodsHolder(),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _nextAppointmentText(),
                    _appoinmentCard(),
                    _areaSpecialistsText(),

                    _specialistsCardInfo(),

                    //_specialistsCardInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   currentIndex: _selectedIndex,
      //   items: [
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(
      //     //       LineAwesomeIcons.home,
      //     //       size: 30.0,
      //     //     ),
      //     //     title: Text('1')),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(
      //     //       LineAwesomeIcons.search,
      //     //       size: 30.0,
      //     //     ),
      //     //     title: Text('2')),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(
      //     //       LineAwesomeIcons.gratipay,
      //     //       size: 30.0,
      //     //     ),
      //     //     title: Text('3')),
      //   ],
      //   onTap: onTapped,
      // ),
    );
  }

  Positioned _moodsHolder() {
    return Positioned(
      bottom: -45,
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 5.5,
                blurRadius: 5.5,
              )
            ]),
        child: MoodsSelector(),
      ),
    );
  }

  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: purpleGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi ' + username,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'How are you feeling today ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextAppointmentText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Your Next Appointment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
            ),
          ),
        ],
      ),
    );
  }

  Container _appoinmentCard() {
    return Container(
      height: 240.0,
      child: FutureBuilder<List>(
          future: userService.getAllApp(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data![index]['Doctorname']);
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 18.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Color(0xFFD9D9D9),
                                  backgroundImage: NetworkImage(USER_IMAGE),
                                  radius: 36.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: snapshot.data![index]['Doctorname'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '\n' +
                                            snapshot.data![index]['date'],
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '\n570 Kyemmer Stores \nNairobi Kenya C -54 Drive',
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Divider(
                              color: Colors.grey[200],
                              height: 3,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                _iconBuilder(
                                    LineAwesomeIcons.check_circle, 'Check-in'),
                                _iconBuilder(
                                    LineAwesomeIcons.times_circle, 'Cancel'),
                                _iconBuilder(LineAwesomeIcons.calendar_times_o,
                                    'Calender'),
                                _iconBuilder(
                                    LineAwesomeIcons.compass, 'Directions'),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          }),
    );
  }

  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Specialist In Your Area',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: midColor,
            ),
          ),
        ],
      ),
    );
  }

  DateTime dateTime = DateTime.now();

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
          maximumDate: DateTime(DateTime.now().year, DateTime.now().month + 1,
              DateTime.now().day + 7),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) => setState(
            () => dateTime = dateTime,
          ),
        ),
      );

  Widget _specialistsCardInfo() {
    return Container(
      height: 240.0,
      child: FutureBuilder<List>(
          future: docotorService.getAllDoctors(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data![index]['name']);
                    return GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 18.0),
                        margin: EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1.0,
                                blurRadius: 6.0,
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Color(0xFFD9D9D9),
                                  backgroundImage: NetworkImage(USER_IMAGE),
                                  radius: 36.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        text: 'Wellness\n',
                                        style: TextStyle(
                                          color: Colors.purple,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: snapshot.data![index]['name'],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '\nPoplar Pharma Limited',
                                            style: TextStyle(
                                              color: Colors.black45,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                '\nDermatologist \nSAn Franscisco CA | 5 min',
                                            style: TextStyle(
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.0,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        print('sssssssssssssssssssssssssss');
                                        Doctorname =
                                            snapshot.data![index]['name'];
                                        print(snapshot.data![index]['name']);
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Stack(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    overflow: Overflow.visible,
                                                    children: [
                                                      Container(
                                                        height: 300,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              buildDateTimePicker(),
                                                              Container(
                                                                width: 90,
                                                                height: 45,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment
                                                                        .centerRight,
                                                                    colors: [
                                                                      Color(
                                                                          0xffffae88),
                                                                      Color(
                                                                          0xff8f93ea)
                                                                    ],
                                                                  ),
                                                                ),
                                                                child:
                                                                    MaterialButton(
                                                                        onPressed:
                                                                            () {
                                                                          /// PUT THE CODE IN HERE :::
                                                                          var result = dateTime.toString().substring(
                                                                              1,
                                                                              19);
                                                                          ; // 'artlang'

                                                                          AppService()
                                                                              .addApp(username, Doctorname, result)
                                                                              .then((val) {
                                                                            //_navigateToNextScreen(context);

                                                                            print("username is :" +
                                                                                username);
                                                                            Fluttertoast.showToast(
                                                                                msg: val.data['msg'],
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.BOTTOM,
                                                                                timeInSecForIosWeb: 1,
                                                                                backgroundColor: Colors.green,
                                                                                textColor: Colors.white,
                                                                                fontSize: 16.0);
                                                                          });
                                                                        },
                                                                        materialTapTargetSize:
                                                                            MaterialTapTargetSize
                                                                                .shrinkWrap,
                                                                        shape:
                                                                            StadiumBorder(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: const <Widget>[
                                                                              Text(
                                                                                "Book",
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: -50,
                                                          child: CircleAvatar(
                                                            child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            70)),
                                                                child: Image.asset(
                                                                    "assets/images/log.jpg")),
                                                            radius: 45,
                                                          ))
                                                    ]),
                                              );
                                            });
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      padding: const EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: purpleGradient,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(80.0)),
                                        ),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              minWidth: 88.0,
                                              minHeight:
                                                  36.0), // min sizes for Material buttons
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Book Visit',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              LineAwesomeIcons.heart,
                              color: lightColor,
                              size: 36,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          }),
    );
  }
}
