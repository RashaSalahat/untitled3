import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/configuration.dart';
import 'package:hotel_booking/screen2toys.dart';
import 'package:hotel_booking/toy.dart';

import 'api/toy.dart';
import 'theme/color.dart';

class HomeToyScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeToyScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    Toy Service = Toy();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: const BackButton(color: Colors.black),
      // ),
      body: Container(
        child: FutureBuilder<List>(
          future: Service.getAllToys(),
          builder: (context, snapshot) {
            int? d = snapshot.data?.length;
            print(snapshot.data?.length);
            if (snapshot.hasData) {
              print(snapshot.data![0]["name"]);
              return ListView.builder(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  itemCount: d,
                  itemBuilder: (BuildContext context, int index) {
                    //Activity activity = widget.destination.activities[index];

                    return Container(
                        child: AnimatedContainer(
                      transform: Matrix4.translationValues(xOffset, yOffset, 0)
                        ..scale(scaleFactor)
                        ..rotateY(isDrawerOpen ? -0.5 : 0),
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Screen2(
                                                ind: index,
                                              )));
                                },
                                child: Container(
                                  height: 240,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xfff2cbd0),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: shadowList,
                                              ),
                                              margin: EdgeInsets.only(top: 50),
                                            ),
                                            Align(
                                              child: Hero(
                                                  tag: index,
                                                  child: Image.asset(
                                                    productToys[index].image,
                                                    width: 400,
                                                    height: 700,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        //padding: EdgeInsets.fromLTRB(40, 60, 20,20),
                                        alignment: Alignment.center,
                                        child: Text(
                                          snapshot.data![index]["name"],
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontFamily: 'Courier'),
                                        ),
                                        height: 240,
                                        margin: EdgeInsets.only(
                                            top: 60, bottom: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20))),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    ));
                  });
            } else {
              return const Center(
                child: Text('No Data Found'),
              );
            }
          },
        ),
      ),
    );
  }
}
