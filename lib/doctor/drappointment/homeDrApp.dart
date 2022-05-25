import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/doctor/drappointment/app.dart';
import 'package:hotel_booking/doctor/drappointment/services/authservice.dart';
import 'package:hotel_booking/doctor/drappointment/utisl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class DrAppHomePage extends StatefulWidget {
  DrAppHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DrAppHomePageState createState() => _DrAppHomePageState();
}

class _DrAppHomePageState extends State<DrAppHomePage> {
  var date;
  Doc docService = Doc();
  int _selectedIndex = 0;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: purpleGradient,
          ),
        ),
        elevation: 20,
        titleSpacing: 20,
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
                //_moodsHolder(),
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
                    //_notificationCard(),
                    _nextAppointmentText(),
                    _appoinmentCard(),
                    //_specialistsCardInfo(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _backBgCover() {
    return Container(
      height: 200.0,
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
        children: const <Widget>[
          Text(
            'Hi Dr',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'We are always proud to\n have you with us',
            style: TextStyle(
              fontSize: 18,
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
        children: const <Widget>[
          Text(
            'Your Requests Appointment',
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

  //////

  Container _appoinmentCard() {
    return Container(
      height: 240.0,
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: FutureBuilder<List>(
          future: docService.getAllpendings(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                  //  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print(snapshot.data![index]['username']);

                    return GestureDetector(
                        child: Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const CircleAvatar(
                                backgroundColor: Color(0xFFD9D9D9),
                                backgroundImage: NetworkImage(USER_IMAGE),
                                radius: 36.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: snapshot.data![index]['username'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\n  AT : \n',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: snapshot.data![index]['date'],
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
                              Container(
                                  child: (InkWell(
                                      onTap: () {
                                        date = snapshot.data![index]['date'];
                                        AuthServicedoctor()
                                            .accept("Accepted", date)
                                            .then((val) {
                                          Fluttertoast.showToast(
                                              msg: "Updated Successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        });
                                      },
                                      child: _iconBuilder(
                                          LineAwesomeIcons.check_circle,
                                          'Accept ')))),
                              Container(
                                  child: (InkWell(
                                      onTap: () {
                                        print('s');

                                        date = snapshot.data![index]['date'];
                                        AuthServicedoctor()
                                            .cancel("Canceled", date)
                                            .then((val) {
                                          Fluttertoast.showToast(
                                              msg: "Updated Successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        });
                                      },
                                      child: _iconBuilder(
                                          LineAwesomeIcons.times_circle,
                                          'Cancel')))),
                            ],
                          )
                        ],
                      ),
                    ));
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
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
