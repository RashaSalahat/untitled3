import 'dart:ui';

import 'package:hotel_booking/Fitness/chart/data/latest_workout.dart';
import 'package:hotel_booking/Fitness/chart/theme/colors.dart';
import 'package:hotel_booking/Fitness/chart/widget/chart_activity_status.dart';
import 'package:hotel_booking/Fitness/chart/widget/sleep_api.dart';
import 'package:hotel_booking/Fitness/chart/widget/workout_api.dart';
import 'package:hotel_booking/Fitness/chart/widget/water_intake_progressbar.dart';
import 'package:hotel_booking/Fitness/chart/widget/water_intake_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../model/Mass.dart';

class Chartpage extends StatefulWidget {
  const Chartpage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Chartpage> {
  Mass MassService = Mass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        // builder: (context, snapshot) {
        ///  print("print Mass next line");
        //  print(snapshot.data);
        //  print(MassService.getAllMass());
        // if (snapshot.hasData) {
        //  print("rasha");
        //  ListView.builder(
        //   itemCount: 1,
        // itemBuilder: (context, index) {
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 14, color: black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(LineIcons.bell),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [secondary, primary]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: (size.width),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "BMI (Body Mass Index)", //
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                            Text(
                              "You have a normal weight", //
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: white),
                            ),
                            Container(
                              width: 95,
                              height: 35,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [fourthColor, thirdColor]),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "View More",
                                  style: TextStyle(fontSize: 13, color: white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient:
                            LinearGradient(colors: [fourthColor, thirdColor]),
                      ),
                      child: Center(
                        child: Text(
                          "20,3",

                          ///
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Target",
                      style: TextStyle(
                          fontSize: 17,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/today_target_detail");
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Check",
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Activity Status",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: LineChart(activityData()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Heart Rate",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: (size.width - 80) / 2,
                  height: 320,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.01),
                            spreadRadius: 20,
                            blurRadius: 10,
                            offset: Offset(0, 10))
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        WateIntakeProgressBar(),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "Milk Intake",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(
                                    "Real time updates",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: black.withOpacity(0.5)),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  WaterIntakeTimeLine()
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: (size.width - 80) / 2,
                      height: 150,
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: black.withOpacity(0.01),
                                spreadRadius: 20,
                                blurRadius: 10,
                                offset: Offset(0, 10))
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sleep",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Flexible(
                              child: SleepChartAPI(),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: (size.width - 80) / 2,
                        height: 150,
                        decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                  color: black.withOpacity(0.01),
                                  spreadRadius: 20,
                                  blurRadius: 10,
                                  offset: Offset(0, 10))
                            ],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        colors: [
                                          fourthColor,
                                          primary.withOpacity(0.5)
                                        ]),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: primary),
                                  child: Center(
                                    child: Text(
                                      "230 Cal",
                                      style:
                                          TextStyle(fontSize: 10, color: white),
                                    ),
                                  ),
                                )),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Workout Progress",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                Container(
                  width: 95,
                  height: 35,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [secondary, primary]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weekly",
                        style: TextStyle(fontSize: 13, color: white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: white,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.01),
                        spreadRadius: 20,
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ],
                  borderRadius: BorderRadius.circular(30)),
              child: LineChartAPI(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Activity Hours",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                Text(
                  "See more",
                  style: TextStyle(fontSize: 15, color: black.withOpacity(0.5)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(latestWorkoutJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: black.withOpacity(0.01),
                              spreadRadius: 20,
                              blurRadius: 10,
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        latestWorkoutJson[index]['img']))),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Container(
                              height: 55,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    latestWorkoutJson[index]['title'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    latestWorkoutJson[index]['description'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: black.withOpacity(0.5)),
                                  ),
                                  Stack(children: [
                                    Container(
                                      width: size.width,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: bgTextField),
                                    ),
                                    Container(
                                      width: size.width *
                                          (latestWorkoutJson[index]
                                              ['progressBar']),
                                      height: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          gradient: LinearGradient(
                                              colors: [primary, secondary])),
                                    )
                                  ])
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: primary)),
                            child: Center(
                              child: Icon(Icons.arrow_forward_ios,
                                  size: 11, color: primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    )
        // }
        //);

        //  }
        //return CircularProgressIndicator();
        /*
          else {
            return CircularProgressIndicator();
          }*/
        //}
        );
  }
}
