import 'package:flutter/material.dart';
import 'package:hotel_booking/Doctor/loginDr/loginDr_screen.dart';
import 'package:hotel_booking/doctor/Doctor/configurationdoctor.dart';
import 'package:hotel_booking/doctor/chatting_page.dart';
import 'package:hotel_booking/doctor/drappointment/homeDrApp.dart';

import 'doctorTable.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: drawerColor,
      padding: EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //CircleAvatar(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text('Miroslava Savitskaya',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  // Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChattingPage();
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Color(0xff6a515e),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Chat',
                            style: TextStyle(
                                color: Color(0xff6a515e),
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return DrAppHomePage(
                            title: "",
                          );
                        },
                      ));
                      print("element");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.request_page,
                          color: Color(0xff6a515e),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Request',
                            style: TextStyle(
                                color: Color(0xff6a515e),
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return TableDoctor();
                        },
                      ));

                      print("element");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.table_rows_outlined,
                          color: Color(0xff6a515e),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Schedule ',
                            style: TextStyle(
                                color: Color(0xff6a515e),
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                  ))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginDrScreen();
                        },
                      ));

                      print("element");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Color(0xff6a515e),
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Logout',
                            style: TextStyle(
                                color: Color(0xff6a515e),
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                  )))
            ],
          ),
          Row(
              // children: [
              //   Icon(Icons.settings,color: Colors.white,),
              //   SizedBox(width: 10,),
              //   Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              //   SizedBox(width: 10,),
              //   Container(width: 2,height: 20,color: Colors.white,),
              //   SizedBox(width: 10,),
              //   Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              //
              //
              // ],

              )
        ],
      ),
    );
  }
}
